import { Component, OnInit, ViewChild } from '@angular/core';
import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';


@Component({
  selector: 'import',
  templateUrl: './importMetas.html',
  styleUrls: ['./importMetas.css']
})

export class ImportMetas implements OnInit{
  constructor(private alunoService: AlunoService) {}

    public csvRecordsArray: any[] = [];
    public fileSelected: boolean = false;
    public alunos: any[]=[];
    public aluno: Aluno = new Aluno();
    public csvRecords: any[] = [];
    public override = false;
    public notaVazia = false;
    public alunosImportados:Aluno[] = [];
    public wrongMeta = false;

    @ViewChild("fileImportInput") fileImportInput: any;
      fileChangeListener($event: any): void {
        var files = $event.srcElement.files;
        if (files[0].name.endsWith(".csv")) {
          var input = $event.target;
          var reader = new FileReader();

          reader.readAsText(input.files[0]);
          reader.onload = (data) => {
            let csvData = reader.result;
            let csvRecordsArray = (csvData as string).split(/\r\n|\n/);
              for(let i=0;i<csvRecordsArray.length;i++){
              let rowdata = csvRecordsArray[i].match(/("[^"]*")|[^,]+/g);
              this.csvRecords.push(rowdata);
              }
          }
          this.fileSelected = true;
          console.log(this.csvRecords);
        reader.onerror = function() {
            alert("Unable to read " + input.files[0]);
          };
        } else {
          alert("Selecione um arquivo .csv, por favor");
          this.fileImportInput.nativeElement.value = "";
          this.csvRecords = [];
          this.fileSelected = false;
        }
    }

    importarPlanilha(){

      if(!this.fileSelected){
        return alert("Selecione um arquivo CSV")
      }
      if(this.csvRecords.length < 2){
        return alert("Verifique os dados da planilha importada! Ou atualize o arquivo enviado!");
      }
     
      console.log("Importing...");
      var conceitos = this.getConceitosFromCSV(this.csvRecords);

      for(var i=1;i<this.csvRecords.length;i++){
        var alunoNome = this.csvRecords[i][0];
        var aluno:Aluno = this.getAlunoFromName(alunoNome);
        
        if(aluno == null){
          this.resetImport();
          return alert("Você está tentando importar com algum aluno não cadastrado! Cheque sua planilha.")
        }

        this.checkOverridingMetas(aluno,conceitos);
        for(var j=0;j<conceitos.length;j++){
          aluno.metas[conceitos[j]] = this.csvRecords[i][j+1];
          this.checkNotaVazia(this.csvRecords[i][j+1]);
        }
        this.alunosImportados.push(aluno);
      }

    console.log(this.alunosImportados);

    this.confirmMessageAndUpdateServer()

    this.resetImport();
  }

  confirmMessageAndUpdateServer(){
    if(!this.override){
      if(!this.notaVazia){
        if(!this.wrongMeta){
          this.atualizaAlunosImportadosServidor(this.alunosImportados);
        }else{
          if(confirm("Alguma meta está diferente de MA, MPA ou MANA, você deseja enviar assim mesmo?")){
            this.atualizaAlunosImportadosServidor(this.alunosImportados);
          }else{
            this.getServidorAlunos();
          }
        }
      }else{
        if(confirm("Existe uma ou mais notas vazias, você quer importar mesmo assim?")){
          this.atualizaAlunosImportadosServidor(this.alunosImportados);
        }else{
          this.getServidorAlunos();
        }
      }
    }else{
      if(!this.notaVazia){
        if(!this.wrongMeta){
          if(confirm("Você tem certeza que quer sobrescrever?")){
            this.atualizaAlunosImportadosServidor(this.alunosImportados);
          }else{
          this.getServidorAlunos();
          }
        }else{
         if(confirm("Alguma meta está diferente de MA, MPA ou MANA, você deseja enviar assim mesmo?")){
            this.atualizaAlunosImportadosServidor(this.alunosImportados);
         }else{
           this.getServidorAlunos();
          } 
        }
      }else{
        if(confirm("Existe uma ou mais notas vazias, você quer importar mesmo assim?")){
          this.atualizaAlunosImportadosServidor(this.alunosImportados);
        }else{
          this.getServidorAlunos();
        }
      }
    }
  }



    getServidorAlunos(){
      this.alunoService.getAlunos()
      .then(as => this.alunos = as)
      .catch(erro => alert(erro));
    }

    checkNotaVazia(nota:string):void{
      if(nota != undefined){
        nota = nota.toUpperCase();
      }else{
        nota = "";
      }
      if (nota == "") { 
          this.notaVazia = true;
      }
      this.checkWrongMeta(nota);
    }

    checkWrongMeta(nota:string):void{
      if( (!(nota =="MPA")) && (!(nota == "MA")) && (!(nota=="MANA")) ) {
        this.wrongMeta = true;
      }
    }

    resetImport(){
      this.alunosImportados = [];
      this.csvRecords = [];
      this.override = false;
      this.notaVazia = false;
      this.wrongMeta = false;
    }

    atualizaAlunosImportadosServidor(alunosImportados:Aluno[]){
      for(var i=0;i<alunosImportados.length;i++){
        this.atualizarAluno(alunosImportados[i]);
      }
      alert("Alunos atualizados! cheque a tabela de Metas!");
    }

    atualizarAluno(aluno: Aluno): void {
      this.alunoService.atualizar(aluno)
         .catch(erro => alert(erro));
    }

    checkOverridingMetas(aluno:Aluno, conceitos:string[]):void{
      
      var metas = aluno.metas;
      var metasAmount = [];
      for(var i=0;i<conceitos.length;i++){
        if( (metas[conceitos[i]] != undefined) && (metas[conceitos[i]] != "") ){
          metasAmount.push(metas[conceitos[i]]);
        }  
      }

      if(metasAmount.length > 0){
        this.override = true;
      }

    }
    

    getAlunoFromName(nome:string):Aluno{
      var alunoProcurado:Aluno;
      for(var i=0;i<this.alunos.length;i++){
        if(this.alunos[i].nome == nome){
          alunoProcurado = this.alunos[i];
          return alunoProcurado
        }
      }
        return null
    }

    getConceitosFromCSV(data:any):string[]{
      var conceitos:string[] = [];
      var tamanhoConceitos = data[0].length;
      for(var i=1;i<tamanhoConceitos;i++){
        conceitos.push(data[0][i]);
      }

      return conceitos;
    }
    
    ngOnInit(){
      this.alunoService.getAlunos()
      .then(as => this.alunos = as)
      .catch(erro => alert(erro));
    }
}