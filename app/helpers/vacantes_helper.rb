module VacantesHelper
  def cambiar_estado_solicitudes(vacante,candidato)
    solicitudes = Solicitud.find(:all, :conditions => ["vacante_id = ?",vacante])
    solicitudes.each do |sol|
      sol.estado = 'Rechazado'
      sol.save!
    end
    if !candidato.nil?
      solicitud = Solicitud.find(:first, :conditions => ["candidato_id = ? and vacante_id = ?",candidato,vacante])
      solicitud.estado = 'Contratado'
      solicitud.save!
    end
  end
end