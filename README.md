# ScriptPortugol
Script de instalação do portugol para navegador

Requisitos:
- PHP 5.1.0 ou mais recentes
- Apache

(Com o comando 'sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt' instalamos ambos.)

- Insira manualmente o caminho que escolheu para instalar o Portugol, altere esta função do arquivo modulo.php "var.interpreta("/SeuEndereco/mportugol/teste.por")"

- Você pode optar por excluir a paste "teste", que se localiza em "/SeuEndereco/mportugol/teste"


Verificações pós-instalação:

- Certifique-se que existe o arquivo lua.so em um diretório como /usr/lib/php5/20131226

- Coloque o seguinte caminho na barra de endereço do seu navegador
 'localhost/SeuEndereco/mportugol/teste/testeLua.php', a mensagem 'O LUA-PHP está funcionando." deve ser impressa na tela.

- Com o caminho 'localhost/SeuEndereco/mportugol/teste' você terá um ambiente para inserir códigos portugol e receber uma resposta impressa na tela do seu navegador.


