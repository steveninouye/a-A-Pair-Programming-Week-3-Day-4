# == Schema Information
#
# Table name: answer_choices
#
#  id            :bigint(8)        not null, primary key
#  question_id   :integer          not null
#  answer_choice :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AnswerChoice < ApplicationRecord
end
