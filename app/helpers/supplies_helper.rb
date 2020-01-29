module SuppliesHelper
  def choose_new_or_edit_supplies
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      #action_name == 'confirm'は、validationがかかったときに必要
      confirm_supplies_path
    elsif action_name == 'edit'
      supply_path
    end
  end
end
