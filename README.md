# RottenPotatoes

Uma aplicação Rails para gerenciamento de filmes. Os usuários podem visualizar, adicionar, editar e excluir filmes, com funcionalidades de ordenação por título, classificação e data de lançamento.

## Implementação

A aplicação utiliza o padrão MVC do Rails:

- **Model**: `Movie` com atributos title, rating, description e release_date
- **Controller**: `MoviesController` implementa operações CRUD completas
- **Views**: Interface para listagem, visualização, criação e edição de filmes

### Funcionalidade de Ordenação

A ordenação da lista de filmes é implementada no `MoviesController#index`:

- **Parâmetros aceitos**: `sort` (coluna) e `dir` (direção)
- **Colunas válidas**: title, rating, release_date
- **Direções válidas**: asc (crescente), desc (decrescente)
- **Valores padrão**: title/asc
- **Implementação**: Usa `Movie.order("#{@sort_col} #{@sort_dir}")` com validação de entrada para prevenir SQL injection

## Instalação

### Pré-requisitos
- Ruby 3.4.6
- Bundler
- SQLite3

### Passos

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd myrottenpotatoes
```

2. Instale as dependências:
```bash
bundle install
```

3. Configure o banco de dados:
```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

4. Inicie o servidor:
```bash
bin/rails server
```

A aplicação estará disponível em `http://localhost:3000`

## Docker (Alternativo)

```bash
docker build -t rottenpotatoes .
docker run -p 3000:3000 rottenpotatoes
```
