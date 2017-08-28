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

meta
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
