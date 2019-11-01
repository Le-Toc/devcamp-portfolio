class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #This is a before action.  What this does is call a method before the index method is called.  In this case what it will do is call the method set_blog on only :show, :edit, :update and :destroy.  This effectively puts the lines from set_blog at the top of the recieving methods.  Before actions are used to get rid of duplicate code

  # GET /blogs
  # GET /blogs.json
  def index #This was hit when we went to localhost:3000/blogs
    @blogs = Blog.all #This will get all of the blogs and put them into @blogs.  This will be available to the view.  "Blog.all" is called a modal call.
    #Rails is very convention heavy.  This means that the naming conventions should stay consistent.  For example this index action relates to the index file in the blogs folder in views (app/views/blogs/index.html.erb).  The index file will use the @blogs variable in the page.  If you change the name of either it will throw an error.
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new #All that this "new" method does is instantiate a new Blog.  This links to app/views/blogs/new.html.erb.  When this action is ativated a new page will open which will allow the user to input text.  This text will then be used to create the actual blog.  You can see this in the create method on this page.
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit #The edit and update methods are linked in the same way that the new and create actions are.  Like new, edit simple creates the form for the user to insert details and update, like create, is the method that actually writes to the database.
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save # If the blog is valid
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        # REWRITE THIS!!
        # format.html means format the html.  This means make this available in the browser.  It is then saying redirect to the blog.  Redirect will which the page to another page.  In this case if you put in "@blog" as the destination then rails will take this as meaning "redirect this page to the show page for the given blog".  The actual code is "redirect_to blog_path(@blog)".  "@blog" is a shortcut for "blog_path(@blog)". The notice will output a message to the body of the page.
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)# blog_params are taken from the method bloy_params at the bottom of this page.  It getting the inputs from the user in the edit page and allowing this method to use them.  Just like in the create action.  I think the update method here, "@blog.update()" is the actual method that updates the database.
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id]) #Find a blog based on parameters   Search though all of the blogs by the id and if it has the correct id assign the blog to @blog
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params# This takes the title and the body inputs from the user and allows methods like create and update to use them.  I'm not sure if it puts them into a variable or if the create and update methods called this method and it returns the values straight.  I think it is the latter.
      params.require(:blog).permit(:title, :body)
    end
end
