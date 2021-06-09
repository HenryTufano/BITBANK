import utils
import objs
import strutils
import strformat
var x = "1"
while x != "5":

    menu()
    var x = readline(stdin)
    case x
        of "1": adicionaCliente()
        of "2": deposito()
        of "3": saque()
        of "4": listaClientes()
        of "5": break
        else: echo "Opção inválida" 
        