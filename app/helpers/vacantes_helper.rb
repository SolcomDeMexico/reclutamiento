module VacantesHelper
  
  def cambiar_estado_solicitudes(vacante,candidato)
    solicitudes = Solicitud.find(:all, :conditions => ["vacante_id = ?",vacante])
    solicitudes.each do |sol|
      sol.update_attributes(:estado => 'Rechazado')
      sol.save!
    end
    if !candidato.nil?
      solicitudes2 = Solicitud.find(:all, :conditions => ["candidato_id = ? and vacante_id = ?",candidato,vacante])
      solicitudes2.each do |solicitud|
        solicitud.update_attributes(:estado => 'Contratado')
        solicitud.save!
      end
    end
  end
    
end