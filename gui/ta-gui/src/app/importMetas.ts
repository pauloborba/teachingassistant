import { Component, OnInit, ViewChild } from '@angular/core';
import { Aluno } from './aluno';


@Component({
  selector: 'import',
  templateUrl: './importMetas.html',
  styleUrls: ['./importMetas.css']
})

export class ImportMetas implements OnInit{

    ngOnInit(){
    }

    public csvRecordsArray: any[] = [];
    public result: any[] = [];
    public headers: any[] = [];
    public fileSelected: boolean = false;
    public alunos: any[]=[];
    public aluno: Aluno = new Aluno();

    @ViewChild('fileImportInput') fileImportInput: any;

        fileChangeListener($event: any):void{

            var files = $event.srcElement.files;
            if(files[0].name.endsWith('.csv')){
                var input = $event.target;
                var reader = new FileReader();

                reader.readAsText(input.files[0]);
                reader.onload = (data) => {
                    let csvData = reader.result;
                    this.csvRecordsArray = (csvData as string).split(/\r\n|\n/);
                    let tamanho = this.csvRecordsArray.length;
                    this.fileSelected = true;

                    this.headers = this.csvRecordsArray[0].split(",");
                    let obj = this.getObjetos();
                    console.log(obj);
                    //todo metas e tal
                    //dados aluno

                };
                reader.onerror = function(){
                    alert('unable to read '+ input.files[0]);
                };

                }else{
                    alert("Please import valid .csv file.");
                    this.fileImportInput.nativeElement.value = "";
                    this.csvRecordsArray = [];
                }
            }

        getObjetos(): any{
            //TODO: criar for para pegar todos os alunos
            //      resolver casos para cpf já cadastrado
            //      resolver casos para arquivo em branco
            //
            for (let index = 1; index < this.csvRecordsArray.length; index++) {
              const currentline = this.csvRecordsArray[index].split(",");
              var obj = {};
              for (var j = 0; j < currentline.length; j++) {
                obj[this.headers[j]] = currentline[j];
              }
              this.result.push(obj);
            }
            //var currentline = this.csvRecordsArray[i].split(",");
            return this.result;
          }
}