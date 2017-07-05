#language: pt
@quadros
Funcionalidade: Quadros Trello
  Eu como usuário da aplicação Trello
  Desejo utilizar das funcionlidades um quadro
  Para controlar minhas atividades

  @criar_quadro @kanban
  Cenário: Criar um Quadro Kanban Básico
    Dado que meu usuário tenha acesso ao Trello
    Quando criar um quadro
    Então quadro é criado com sucesso
    Quando incluo as listas/colunas
      |Backlog|
      |ToDo|
      |In Progress|
      |Done|
    Então verifico que as listas foram incluídas com sucesso em meu quadro

  @criar_quadro @semanal
  Cenário: Criar um Quadro Semanal de atividades
    Dado que meu usuário tenha acesso ao Trello
    Quando criar um quadro
    Então quadro é criado com sucesso
    Quando incluo as listas/colunas
      |Segunda|
      |Terça|
      |Quarta|
      |Quinta|
      |Sexta|
    Então verifico que as listas foram incluídas com sucesso em meu quadro

  @deletar_quadro
  Cenário: Deletar um Quadro por nome
    Dado que meu usuário tenha acesso ao Trello
    E e obtenha o id do quadro através do nome "meu_novo_quadro_in_day"
    Quando deletar o quadro pelo id
    Então quadro é deletado com sucesso
