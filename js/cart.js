const contenedorTarjetas = document.getElementById("productos-container");
const unidadesElement = document.getElementById("unidades");
const precioElement = document.getElementById("precio"); 
const carritoVacioElement = document.getElementById("carrito-vacio");
const totalesElement = document.getElementById("totales");
const reiniciarCarritoElement = document.getElementById("reiniciar");

function crearTarjetasProductosInicio() {
    contenedorTarjetas.innerHTML = "";
    const productos = JSON.parse(localStorage.getItem("productos"));
    console.log(productos)
    if (productos && productos.length > 0) {
        productos.forEach(producto => {
            const nuevoProducto = document.createElement("div");
            nuevoProducto.classList = "tarjeta-producto";
            nuevoProducto.innerHTML = `
        <img src="img/productos/${producto.id}.jpg">
        <h3>${producto.nombre}</h3>
        <p>$${producto.precio}</p>
        <div>
        <button>-</button>
        <span class="cantidad">${producto.cantidad}</span>
        <button>+</button>
        </div>
        `;
            contenedorTarjetas.appendChild(nuevoProducto);
            nuevoProducto
            .getElementsByTagName("button")[1]
            .addEventListener("click", (e) => {
                const cuentaElement = e.target.parentElement.getElementsByTagName("span")[0];
                cuentaElement.innerText = agregarAlCarrito(producto);
                actualizarTotales();
            });
            nuevoProducto
            .getElementsByTagName("button")[0]
            .addEventListener("click", (e) => {
                restarAlCarrito(producto);
                crearTarjetasProductosInicio();
                actualizarTotales();
            });
        });
    }
}

crearTarjetasProductosInicio();
actualizarTotales();

function actualizarTotales(){
    const productos = JSON.parse(localStorage.getItem("productos"));
    let unidades = 0;
    let precio = 0;
    if (productos && productos.length>0) {
        productos.forEach(producto =>{
            unidades += producto.cantidad;
            precio += producto.precio * producto.cantidad;
        })
        unidadesElement.innerText = unidades;
        precioElement.innerText = precio;
    }

}

function revisarMensajeVacio(){
    const productos = JSON.parse(localStorage.getItem("productos"));
    console.log(productos, productos == true)
    carritoVacioElement.classList.toggle("escondido",productos && productos.length>0);
    totalesElement.classList.toggle("escondido",!(productos && productos.length>0));
}

revisarMensajeVacio();



reiniciarCarritoElement.addEventListener("click", reiniciarCarrito);
function reiniciarCarrito(){
    localStorage.removeItem("productos");
    actualizarTotales();
    crearTarjetasProductosInicio();     
}

document.getElementById("comprar").addEventListener("click", async ()=>{
const res = await comprarCarrito();
        if(res){
            reiniciarCarrito();
            window.location.href = "http://localhost/index_dakiti/compra-exitosa.html"
        }
})