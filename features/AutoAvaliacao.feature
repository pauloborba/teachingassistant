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
