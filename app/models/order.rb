# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  deadline    :datetime
#  description :text
#  price       :decimal(, )
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :bigint
#  executor_id :bigint
#  platform_id :bigint
#  subject_id  :bigint
#
# Indexes
#
#  index_orders_on_client_id    (client_id)
#  index_orders_on_executor_id  (executor_id)
#  index_orders_on_platform_id  (platform_id)
#  index_orders_on_subject_id   (subject_id)
#
class Order < ApplicationRecord
  belongs_to :client
  belongs_to :platform
  belongs_to :executor
  belongs_to :subject
end
