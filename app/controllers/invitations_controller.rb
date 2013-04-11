class InvitationsController < ApplicationController

  def send_invite
    if request.post?
      redirect_to homepage_path, notice: 'Invitation Sent'
    end
  end

  def check_invite
    if request.post?
      if params[:invitation_code].present?
        reward_id = Reward.generate_random_id
        user = User.check_user(params[:invitation_code])

        if current_user.rewards.count > 10
          redirect_to homepage_path, notice: "Reward exceed maximum!"
        elsif user.present?
          if user != current_user
            #Reward for person who invite
            sender = Invitation.new
            sender.user = user
            sender.reward_id = reward_id
            sender.save

            #Reward for person who get invited
            receiver = Invitation.new
            receiver.user = current_user
            receiver.reward_id = reward_id
            receiver.save

            #allow only for one time
            current_user.invited_by = user.id
            current_user.save

            redirect_to homepage_path, notice: "You got a new reward!"
          else
            redirect_to homepage_path, notice: "Cannot input self code"
          end
        else
          redirect_to homepage_path, notice: "Failure in proccess"
        end
      else
        render template: 'home/index'
      end
    end
  end

end
