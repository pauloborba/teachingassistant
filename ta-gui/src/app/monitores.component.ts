//import { Aluno } from '../../../common/aluno';
//import { AlunoService } from './aluno.service';
import { Turma } from '../../../common/turma';

@Component({
   selector: 'monitores',
   templateUrl: './monitores.component.html',
   styleUrls: ['./monitores.component.css']
})

export class MonitoresComponent implements OnInit {
	alunos: Aluno[] = [];
	listarMonitores(turma: Turma): Monitores[] {}
}