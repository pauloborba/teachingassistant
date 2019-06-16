import { Component, OnInit } from '@angular/core';
import { AlunosComponent } from './alunos.component';
import { Aluno } from './aluno';
import { AlunoService } from './aluno.service';


@Component({
  selector: 'app-root',
  templateUrl: './exportMetas.html',
  styleUrls: ['./exportMetas.css']
})

export class ExportMetas implements OnInit{
    constructor(private alunoService: AlunoService) {}

    public tittle: string;
    public prova: Map<String,String[]> = new Map([
        ["MP1", ["requisitos","gerDeConfiguracao","gerDeProjetos"]],
        ["MP2",["SaaS","testes","projeto","refatoracao"]]
        ]);
    public alunos: Aluno[];
    public option: string;

    ngOnInit(): void {
        this.alunoService.getAlunos()
        .then(as => this.alunos = as)
        .catch(erro => alert(erro));
    }

    columns(option:string):string{
        var column_names="";
        column_names = "nome;";

        var conceitos = this.prova.get(option);
        for(var conceito in conceitos){
            column_names = column_names + conceitos[conceito] + ";"
        }

        column_names = column_names.slice(0,-1);
        column_names += "\n";
      
        return column_names;
    }

    rows(option:string):string{
        var dataRows = ""
        for(var i=0;i<this.alunos.length; i++){
            dataRows = dataRows+ this.alunos[i].nome+";";
            var conceitos = this.prova.get(option);
            for(var _ in conceitos){
                dataRows = dataRows + ";";
            }
            dataRows = dataRows.slice(0,-1);
            dataRows += "\n";
        }
        return dataRows;
    }

    exportToCSV(){
        console.log("exporting to csv")
        console.log(this.prova)
        console.log(this.prova.get("MP1"))

        this.alunoService.getAlunos()
        .then(as => this.alunos = as)
        .catch(erro => alert(erro));

        console.log(this.alunos)

        //TODO: get option and update tittle
        this.option = "MP1";
        this.tittle = this.option;

        var csvContent = "";

        var column_names = this.columns(this.option);
        var dataRows = this.rows(this.option);
       
        csvContent = column_names + dataRows;
        console.log(csvContent);

        var filename = this.tittle.replace(/ /g,'')+'.csv'; //gen a filename using the title but getting rid of spaces
        var blob = new Blob([csvContent], { "type": 'text/csv;charset=utf-8;' });
        if (navigator.msSaveBlob) 
        { // IE 10+
            navigator.msSaveBlob(blob, filename);
        } 
        else //create a link and click it
        {
            var link = document.createElement("a");
            if (link.download !== undefined) // feature detection
            { 
            // Browsers that support HTML5 download attribute
            var url = URL.createObjectURL(blob); 
            link.setAttribute("href", url);
            link.setAttribute("download", filename);
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            }
        }
    }

}