Funcionalidade: Assistente de Ensino (Chat)
  Como um estudante
  Eu quero interagir com o chat do assistente de ensino
  Para tirar dúvidas sobre o conteúdo das aulas de forma rápida e contextualizada

  Cenário: Enviar uma dúvida com resposta contextualizada
    Dado que o estudante está autenticado na plataforma
    E acessou o módulo da disciplina de "Engenharia de Software"
    Quando ele digita a mensagem "O que é um requisito não funcional?" no campo de chat
    E clica no botão "Enviar"
    Então o sistema deve exibir a pergunta no histórico da conversa
    E o assistente deve responder com a definição e exemplos de requisitos não funcionais
    E o tempo de resposta deve ser inferior a 5 segundos

  Cenário: Tentar enviar uma mensagem vazia
    Dado que o estudante está com a janela do chat aberta
    Quando ele tenta enviar o formulário com o campo de texto vazio
    Então o sistema não deve registrar o envio da mensagem
    E deve exibir uma indicação visual de que o campo não pode estar em branco
    E o foco do cursor deve permanecer no campo de entrada
    E a página deve corresponder aos padrões de acessibilidade

  Cenário: Interromper a geração de uma resposta longa
    Dado que o estudante enviou a pergunta "Explique o ciclo de vida Scrum em detalhes"
    E o assistente iniciou a transmissão da resposta em tempo real
    Quando o estudante clica no botão "Parar geração"
    Então o assistente deve cessar a geração de texto imediatamente
    E a mensagem parcial gerada até aquele instante deve permanecer visível no histórico
    E o campo de entrada de texto deve ser reabilitado para novas mensagens

  Cenário: Envio offline de dúvida com sincronização automática em segundo plano
    Dado que o estudante está autenticado e com o chat aberto
    E o dispositivo perdeu o acesso à internet
    Quando ele envia a mensagem "Como funciona o polimorfismo?"
    Então o sistema deve manter a mensagem visível no histórico com um ícone de status de erro
    E deve exibir a notificação "Não foi possível conectar ao servidor. Verifique sua conexão."
    E deve disponibilizar a opção "Tentar novamente" junto à mensagem com falha
    E o texto original não deve ser perdido
    E ...
<<<<<<< HEAD
    Quando ...

Cenário: Avaliar a utilidade da resposta gerada pelo assistente
    Dado que o assistente concluiu a geração da resposta para uma dúvida
    Quando o estudante clica no ícone de "Não foi útil" (polegar para baixo)
    Então o sistema deve exibir um menu contextual opcional com opções de motivo ("Incorreta", "Confusa", "Fora do contexto da aula")
    E deve registrar o feedback de qualidade vinculado ao ID da mensagem
    E deve exibir uma confirmação sutil de agradecimento pelo feedback
    E a mensagem original deve permanecer inalterada no histórico
=======
    Quando ...
>>>>>>> f35646bb97afb9194c95fd47c21956135dacce38
