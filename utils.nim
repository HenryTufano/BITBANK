import objs

import strutils
import strformat

var clientes:seq[Cliente]
var din:float
var nome:string
var x:float
var y:int
var limit:float=0.0-100.0
var sub:float
proc linha() =
    echo "==========================================================================="

proc menu*() =
    echo """
    ADMIN - V1 - SEU JOAQUIM
    [1] - CADASTRAR CLIENTE
    [2] - REALIZAR DEPOSITO
    [3] - CADASTRAR SAQUE
    [4] - LISTAR
    [5] - SAIR
	"""
    linha()

    linha()


proc adicionaCliente*() = 
    linha()
    var cliente = Cliente()
    echo "Bem vindo ao Cadastro de Cliente" 

    echo "Digite o nome do Cliente"
    cliente.nome=readline(stdin)

    echo "Digite o endereco do Cliente"
    cliente.endereco=readline(stdin)

    echo "Digite o telefone do Cliente"
    cliente.telefone=readline(stdin)

    cliente.saldo=0.0

    cliente.rendimento=0.0

    echo "Digite o tipo de conta [1] CONTA CORRENTE [2] CONTA POUPANÇA"
    cliente.tconta=parseInt(readline(stdin))

    clientes.add(cliente)
    
    echo "Cliente cadastrado com sucesso!!"
    linha()

proc saque*() =
    echo "Digite o nome do Cliente"
    nome=readline(stdin) 
    for cliente in clientes :
        if nome==cliente.nome:
            if cliente.tconta==1:
                if cliente.saldo>limit:
                    echo "Digite o valor do saque: "
                    sub=parseFloat(readline(stdin))
                    din=cliente.saldo
                    x=din-(sub+(sub*0.005))
                    cliente.saldo=x
                else:
                    echo "OPERAÇÃO NÃO REALIZADA"
            elif cliente.tconta==2:
                if cliente.saldo>limit:
                    echo "Digite o valor do saque: "
                    sub=parseFloat(readline(stdin))
                    din=cliente.saldo
                    x=din-(sub+(sub*0.005))
                    cliente.saldo=x
                else:
                    echo "OPERAÇÃO NÃO REALIZADA"
            else:
                echo "OPERAÇÃO NÃO REALIZADA"

proc deposito*() =
    echo "Digite o nome do Cliente"
    nome=readline(stdin) 
    for cliente in clientes :
        if nome==cliente.nome:
            echo "Digite o valor do deposito: "
            din=parseFloat(readline(stdin))
            cliente.saldo=cliente.saldo+din
            
proc listaClientes*() =
    for cliente in clientes :
        if cliente.tconta==1:
            echo "Nome: ",cliente.nome
            echo "Endereco: ",cliente.endereco
            echo "Telefone: ",cliente.telefone
            echo "Saldo: ",cliente.saldo
        elif cliente.tconta==2:
            while y <= 12:
                cliente.rendimento=cliente.saldo*0.02
                y=y+1
            echo "Nome: ",cliente.nome
            echo "Endereco: ",cliente.endereco
            echo "Telefone: ",cliente.telefone
            echo "Saldo: ",cliente.saldo
            echo "Rendimentos: ",cliente.rendimento