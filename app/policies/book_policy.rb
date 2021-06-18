class BookPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @model = model
  end

  def index?
    @user.admin?
  end

  def books_loan?
    @user.role?
  end

  def show?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    edit?
  end

  def wish_list?
    @user.role?
  end

  def marked_wish?
    @user.role?
  end

  def destroy?
    @user.admin?
  end
end