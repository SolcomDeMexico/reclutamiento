module UsuariosHelper
  def cambiar_roles(rol,perfil) 
    @rol = rol    
      if (rol != 'administrador' && rol != 'gerente_general' && rol != 'empleado') 
        if perfil == 'Ninguno'
          @rol = rol
        else
          if perfil == 'Monterrey'
            @rol = rol.to_s+'_mty'
          else
            @rol = rol.to_s+'_df'
          end
        end
      end
  end

  def cambiar_roles_inverso(rol,perfil)
    @rolInverso = rol
    if (rol != 'administrador' && rol != 'gerente_general' && rol != 'empleado')
      if perfil == 'Ninguno'
        @rolInverso = rol
      else
        if perfil == 'Monterrey'
          rolString = rol.to_s
          @rolInverso = rolString[0,rolString.length-4]
        else
          rolString = rol.to_s
          @rolInverso = rolString[0,rolString.length-3]
        end
      end
    end
  end
  
end