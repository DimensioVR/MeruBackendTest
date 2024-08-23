module Api
    module V1
        class ProductoController < ApplicationController

            #mostrar productos
            def index
                @producto = Producto.all
                render json: @producto


            end 
             #crear un producto
            def create
                nuevoproducto = Producto.new(check_params)

                if nuevoproducto.save
                    render json: { message: "Se ha agregado el producto de manera satisfactoria", data:nuevoproducto }
                else 
                    render json: { message: "Error al agregar el nuevo producto", data:nuevoproducto.errors}
                end


            end
            #mostrar un producto
            def show
                producto = Producto.find(params[:id])
                if producto
                    render json: { message: "Producto encontrado", data: producto }
                else 
                    render json: { message: "No se ha encontrado el  producto", data:producto.errors}
                end
            end
            #editar un producto
            def update
                producto = Producto.find(params[:id])
                if producto.update(check_params)
                    render json: { message: "Producto editado correctamente", data: producto }
                else 
                    render json: { message: "No se ha podido editar el  producto", data:producto.errors}
                end
            end
            #destruir un producto
            def destroy
                producto = Producto.find(params[:id])
                if producto.destroy
                    render json: { message: "Producto eliminado correctamente", data: producto }
                else 
                    render json: { message: "No se ha podido eliminar el  producto", data:producto.errors}
                end
            end

            private 

            def check_params
            params.require(:producto).permit(:name, :description, :stock, :price)
            
            end
        end 
    end
end            