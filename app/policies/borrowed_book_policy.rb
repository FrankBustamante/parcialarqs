class BorrowedBookPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @model = model
  end

  def index?
    @user.admin?
  end

  def user?
    @user.role?
  end

  def new?
    @user.usuario?
  end

  def create?
    new?
  end

  def show?
    false
  end

  def destroy?
    false
  end

  def edit?
    @user.admin?
  end

  def update?
    edit?
  end
end