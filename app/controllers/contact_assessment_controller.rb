class ContactAssessmentController < ApplicationController

  def add_contact
    @contact = Contact.new(user_id: current_user.id)
    @contact.update_db_values(params)
    if @contact.save
      con_asmt_checks(@contact)
    else
      render "assessment/assessment_form"
    end
    render nothing: true
  end

  def remove_contact
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    if current_user.contacts.count == 0
      Preparation.where(user_id: current_user.id, prep_type:"Contact").destroy_all
    end
    render nothing: true
  end

  def con_asmt_checks(contact)
    @ca = ContactAssessment.new(contact)
    @ca.run_all_checks
  end
end
