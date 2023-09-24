# Comandos e Aliases para Linux

Este repositório contém uma coleção de comandos, funções e aliases úteis para sistemas Linux. Os comandos foram desenvolvidos e testados em uma distribuição Ubuntu. Recomenda-se o uso desses comandos em distribuições baseadas em Ubuntu.

Este repositório oferece suporte para as seguintes shells:

> - **Bash:** Os comandos podem ser usados diretamente no shell Bash.

> - **Zsh:** Os comandos podem ser usados no shell Zsh, especialmente quando usado com o framework Oh My Zsh.

Abaixo está a lista de todos os comandos disponíveis e suas explicações:

## Instruções de Instalação

### Opção 1: Usando curl

> Para executar o script diretamente do URL usando `curl`, você pode usar o seguinte comando:

> ```shell
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/mk-nascimento/custom-aliases/main/install.sh)"
> ```
    
## Opção 2: Usando wget
>Se preferir usar o wget, você pode usar o seguinte comando:

> ```shell
> bash -c "$(wget -qO- https://raw.githubusercontent.com/github_user/github_repo/main/script.sh)"
> ```


## Comandos


- **custom_aliases**

   - Descrição: Mostra o conteúdo da pasta de aliases personalizados.
   - Uso: `custom_aliases`

- **change_terminal**

   - Descrição: Altera o emulador de terminal padrão.
   - Uso: `change_terminal`

- **change_terminal**

   - Descrição: Altera o emulador de terminal padrão.
   - Uso: `change_terminal`

- **hc**

   - Descrição: Limpa o histórico do shell.
   - Uso: `hc`

- **hcc**

   - Descrição: Limpa o histórico do shell e a tela atual.
   - Uso: `hcc`

- **hx**

   - Descrição: Limpa o histórico do shell e sai do terminal.
   - Uso: `hx`

- **rmvdir**

   - Descrição: Atalho para remover diretórios recursivamente.
   - Uso: `rmvdir`

- **reload**

   - Descrição: Recarrega a sessão do terminal reiniciando o shell atual.
   - Uso: `reload`

- **upd**

   - Descrição: Atualiza pacotes usando o gerenciador de pacotes padrão (apt ou nala, se disponível).
   - Uso: `upd`

- **ls**

   - Descrição: Lista o conteúdo do diretório atual usando 'exa', se disponível, ou 'ls' padrão.
   - Uso: `ls`

- **cleanup**

   - Descrição: Limpa o cache de pacotes usando 'apt' e 'nala' (se estiver disponível).
   - Uso: `cleanup`

- **git_remove_branch**

   - Descrição: Remove um branch Git localmente e do repositório remoto (se fornecido).
   - Uso: `git_remove_branch nome_do_branch`

- **10s_clear**

   - Descrição: Limpa o terminal após um atraso de 10 segundos.
   - Uso: `10s_clear`

- **codeh**

   - Descrição: Abre o Visual Studio Code no diretório atual.
   - Uso: `codeh`

- **jlog**

   - Descrição: Exibe o arquivo com logs repetidos na Área de Trabalho usando 'journalctl'.
   - Uso: `jlog`

- **npm_init**

   - Descrição: Inicializa um projeto npm com configurações padrão.
   - Uso: `npm_init`

- **tsconfig**

   - Descrição: Gera um arquivo `tsconfig.json` para projetos TypeScript.
   - Uso: `tsconfig`

- **flatpak_remove**

   - Descrição: Desinstala um pacote Flatpak e exclui seus dados associados.
   - Uso: `flatpak_remove pacote`

- **flatpak_repair**

   - Descrição: Repara a instalação do Flatpak.
   - Uso: `flatpak_repair`

- **flatpak_reset**

   - Descrição: Desinstala todos os pacotes Flatpak e exclui seus dados associados.
   - Uso: `flatpak_reset`

- **snap_remove**

   - Descrição: Remove um pacote Snap e purga seus dados associados.
   - Uso: `snap_remove pacote`

- **snap_refresh**

   - Descrição: Atualiza pacotes Snap.
   - Uso: `snap_refresh`


## Comando para Adicionar Aliases Personalizados

Você pode usar o comando a seguir para adicionar aliases personalizados ao seu ambiente:

- **set_alias**

   - Descrição: Adiciona um alias personalizado ao seu ambiente.
   - Uso: `set_alias <alias-name> <alias-command>`
   
   - Exemplo: Para adicionar um alias chamado "print-hello" que execute o comando "echo Hello World!", você pode executar:

     ```shell
        set_alias print-hello echo Hello World!
     ```

   - Observação: Este comando permite que você adicione aliases personalizados ao seu ambiente. Ele verifica se o alias já existe e o adiciona ao arquivo de aliases personalizados, caso contrário. Lembre-se de abrir um novo terminal ou recarregar o terminal atual para aplicar as alterações.

## Como Usar

Para usar esses comandos, siga as instruções fornecidas acima para cada um deles.

## Author

- **Author**: Maksuel Nascimento
- **GitHub**: [@github: mk-nascimento](https://github.com/mk-nascimento)

## Data de Criação

>Setembro 24, 2023


## Documentação Adicional

* [Documentação oficial do bash](https://www.gnu.org/software/bash/manual/html_node/index.html)


## Como Contribuir

Você pode contribuir para este repositório enviando um pull request com alterações ou melhorias.

Para enviar um pull request, siga estas etapas:

1. Faça um fork do repositório.
2. Crie um branch para suas alterações.
3. Faça as alterações necessárias.
4. Execute os testes para garantir que tudo esteja funcionando corretamente.
5. Envie um pull request para o branch `develop`.

Agradecemos seu feedback e contribuições!
