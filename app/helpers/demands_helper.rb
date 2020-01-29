module DemandsHelper
  def choose_new_or_edit_demands
    if action_name == 'new' || action_name == 'confirm'
      confirm_demands_path
    elsif action_name == 'edit'
      demand_path
    end
  end
end
