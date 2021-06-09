type
    Cliente* = ref object of RootObj
        nome*:string 
        endereco*:string 
        telefone*:string  
        saldo*:float
        rendimento*:float
        tconta*:int