/**
 * Função para enviar e-mail ao aluno.
 * @param {string} studentName - Nome do aluno.
 * @param {string} email - Endereço de e-mail do aluno.
 * @param {string} message - Mensagem a ser enviada.
 * @returns {Promise<void>}
 */
export async function sendEmail(studentName, email, message) {
    try {
      const response = await fetch('/api/send-email', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          studentName,
          email,
          message,
        }),
      });
  
      if (!response.ok) {
        throw new Error('Falha ao enviar o e-mail');
      }
  
      console.log(`E-mail enviado com sucesso para ${studentName}`);
    } catch (error) {
      console.error('Erro ao enviar e-mail:', error);
      throw error;
    }
  }