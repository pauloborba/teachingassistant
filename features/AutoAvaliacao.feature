FEATURE: Autoavaliação

AS A aluno 
I WANT TO fazer uma autoavaliação para que o professor possa utilizar de comparação e mostrar que talvez, com base no meu esforço, eu recebi uma nota injusta
SO THAT posso melhorar meus conceitos

SCENARIO: Autoavaliação do aluno Edjan bem sucedida
GIVEN o aluno “Edjan” está na página de autoavaliação
WHEN o aluno “Edjan” preenche os conceitos para todas as metas 
THEN o sistema armazena a avaliação que o aluno “Edjan” deu a si mesmo

SCENARIO: Confirmação autoavaliação bem sucedida
GIVEN o aluno “Edjan” está na página de autoavaliação
AND “Edjan” preencheu todos os conceitos para todas as metas
WHEN o aluno “Edjan” clica no botão “auto-avaliar” 
THEN o sistema exibe uma caixa de diálogo com uma mensagem de confirmação

SCENARIO: Autoavaliação do aluno Edjan mal sucedida
GIVEN o aluno “Edjan” está na página de autoavaliação
AND “Edjan” não preencheu a autoavaliação para a meta “Especificar requisitos com qualidade”
WHEN o aluno “Edjan” tenta fazer a autoavaliação
THEN o sistema não valida a autoavaliação do aluno “Edjan”

SCENARIO: Confirmação autoavaliação mal sucedida
GIVEN o aluno “Edjan” está na página de autoavaliação
AND “Edjan” não preencheu a autoavaliação para a meta “Especificar requisitos com qualidade”
WHEN o aluno “Edjan” clica no botão “auto-avaliar” 
THEN o sistema uma mensagem de erro informando que falta avaliar a meta “Especificar requisitos com qualidade”
AND o sistema não valida a autoavaliação de “Edjan”
AND o sistema exibe alguma coisa

SCENARIO: Nenhuma discrepância encontrada - GUI
GIVEN o professor “Paulo” avaliou todos os seus alunos (“Edjan”, “Pedro” e “Lucas”)
AND todos os alunos (“Edjan”, “Pedro” e “Lucas”) se auto avaliaram
AND o aluno “Edjan” tem conceito inferior em 1 de 5 metas
AND o aluno “Pedro” só tem conceitos superiores
AND o aluno “Lucas” só tem conceitos iguais
AND o professor “Paulo” está logado no sistema como “professor”
WHEN o professor “Paulo” acessa a página de “Estatísticas”
THEN o sistema faz os cálculos de acordo com os critérios especificados 
AND o sistema atualiza todos os dados do gráfico e da lista de alunos
SCENARIO: Uma discrepância encontrada - GUI
GIVEN o professor “Paulo” avaliou todos os seus alunos (“Edjan”, “Pedro” e “Lucas”)
AND todos os alunos (“Edjan”, “Pedro” e “Lucas”) se auto avaliaram
AND há discrepância com o aluno “Edjan”
AND o professor “Paulo” está logado no sistema como “professor”
WHEN o professor “Paulo” acessa a página de “Estatísticas”
THEN o sistema faz os cálculos de acordo com os critérios especificados 
AND o sistema atualiza todos os dados do gráfico e da lista de alunos, possibilitando ao professor “Paulo” visualizar 
AND o sitema permite detalhar que o aluno “Edjan” possui discrepâncias
