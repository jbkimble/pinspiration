class UserPresenter < SimpleDelegator

  def initialize(viewer, viewed)
    @viewer = viewer
    @viewed = viewed
    super(viewer)
  end

  def private_boards
    @private_boards = if viewer == viewed
      viewed.boards.where(isprivate: true)
    else
      Board.joins(:shared_boards).where(shared_boards:{owner_id:viewed.id, viewer_id:viewer.id})
    end
  end


  def display_name
    viewed.name
  end

  private
    attr_reader :viewed, :viewer

end
