import { AlunoService } from './../aluno.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import {Aluno} from './../aluno';

@Component({
  selector: 'app-importar-aluno',
  templateUrl: './importar-aluno.component.html',
  styleUrls: ['./importar-aluno.component.css']
})
export class ImportarAlunoComponent implements OnInit {

  constructor(private alunoService: AlunoService) { }
  
  public csvRecordsArray: any[] = [];
  public result: any[] = [];
  public headers: any[] = [];
  public alunos: any[]=[];
  public aluno: Aluno = new Aluno();

  @ViewChild('fileImportInput') fileImportInput: any;

  fileChangeListener($event: any): void {

    var files = $event.srcElement.files;
    if (files[0].name.endsWith('.csv')) {
      var input = $event.target;
      var reader = new FileReader();

      reader.readAsText(input.files[0]);
      reader.onload = (data) => {

        let csvData = reader.result;
        this.csvRecordsArray = (csvData as string).split(/\r\n|\n/);
        if(this.csvRecordsArray.length <2){
          alert('arquivo vazio');
          this.fileImportInput.nativeElement.value = "";
        }

        this.headers = this.csvRecordsArray[0].split(",");

        for (let index = 1; index < this.csvRecordsArray.length; index++) {
          const currentline = this.csvRecordsArray[index].split(",");
          var obj = {};
          for (var j = 0; j < currentline.length; j++) {
            obj[this.headers[j]] = currentline[j];
          }
          this.result.push(obj);
        }
        console.log(this.result);
        for (let i = 0; i < this.result.length; i++) {
          this.aluno.nome = this.result[i].nome;
          this.aluno.email = this.result[i].email;
          this.aluno.cpf = this.result[i].cpf;
          this.criarAluno(this.aluno);
        } 
        this.result = [];
      };
      reader.onerror = function() {
        alert('Unable to read ' + input.files[0]);
      };
    } else {
      alert('Please import valid .csv file.');
      this.fileImportInput.nativeElement.value = "";
      this.csvRecordsArray = [];
    }
  }

  criarAluno(a: Aluno): void {
    this.alunoService.criar(a)
       .then(ab => {
          if (ab) {
            this.alunos.push(ab);
            this.aluno = new Aluno();
          } else {
            alert('Existem cpfs já cadastrados');
          }
       })
       .catch(erro => alert(erro));
  }

  ngOnInit(): void{
    this.alunoService.getAlunos()
    .then(as => this.alunos = as)
    .catch(erro => alert(erro));
  }
}
