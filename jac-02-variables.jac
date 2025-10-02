# Variables in jac
let age : int = 30;
let name:str = "Mwero Abdalla";
let price:float = 12.5;
let isAdmin:bool = False;


def main()->void{
    print(f" Hello there my name {name}, a {age} years old man  and it's {not isAdmin} that i am the Admin  and the price of everything here is Ksh. {price}");
}

with entry{
    main();
}