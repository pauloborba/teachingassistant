export class CadastroDeMetas {
    metas: String[] = [];
    
    cadastrar(meta: String): void {
      
      return null;
    }

    remover(meta: String): void {
      return null;
    }

    atualizar(metaAntiga: String, metaNova: String): void {
      this.metas.forEach(element => {
        if (element === metaAntiga) {
          element = metaNova
        }
      });
      return null;
    }

    getMetas(): String[] {
      return this.metas;
    }
} 