import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';
import { Matricula } from '../../../common/matricula';
import { Avaliacao } from '../../../common/avaliacao';

@Component({
   selector: 'autoavaliacao',
   templateUrl: './autoavaliacao.component.html',
   styleUrls: ['./autoavaliacao.component.css']
})

export class AutoavaliacaoComponent implements OnInit {
	alunos: Aluno[] = [];
	cadastrarAutoAvaliacao(matricula: Matricula, avaliacoes: Avaliacao[]): void {}
	notificarAutoAvaliacao(matricula: Matricula): void {}
}