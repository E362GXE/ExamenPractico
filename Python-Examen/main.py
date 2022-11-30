print("******Bienvenidos a la venta de pantalones******");
input("========Presione una tecla para continuar========");
name=str(input("Ingrese su nombre: "));
pantalones=int(input("Cantidad de pantalones a llevar: "));

pago=float(pantalones*160.5);

descuento=float;
total=float;
mensaje=str;



if(pantalones==7):
    descuento=(pago*0.1);
    total=(pago-descuento);
    print("Tiene un descuento de 10%");
    print("Total a pagar: Q",total);
elif(pantalones==10):
    descuento=(pago*0.25);
    total=(pago-descuento);
    print("Tiene un descuento de 25%");
    print("Total a pagar: Q",total);
else:
 if(pago>=700):
    descuento = (pago *0.5);
    total = (pago - descuento);
    print("Tiene un descuento de 5%");
    print("Total a pagar: Q", total);
 else:
    print("Pago total: Q",pago);
    input("Gracias por su venta");