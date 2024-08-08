class Board
  def initialize(size, colors)
    @size = size
    @colors = colors
    @secret_code = colors.shuffle
    @current_gues = 0
    @board = []
    size.times do
      @board.push(["#", "#", "#", "#"])
    end
  end

  def display_board
    content = @board.reduce("") do |content, line|
      content += "#{line.join(" ")} \n"
    end
    puts "------"
    puts content
  end

  def gues
    gues = gets.chomp

    gues = gues.split(" ")
    if check_gues(gues) == false
      gues
    else
      puts advice(gues)
      @board[@current_gues] = gues
      @current_gues += 1
      if @current_gues > @size
        puts "You lost."
        "end"
      else
        check_for_wictory(gues, "you")
      end
    end
  end

  def bot_gues
    gues = @colors.shuffle

    if check_gues(gues) == false
      gues
    else
      puts advice(gues)
      @board[@current_gues] = gues
      @current_gues += 1
      if @current_gues > @size
        puts "Bot lost."
        "end"
      else
        check_for_wictory(gues, "bot")
      end
    end
  end

  def advice(gues)
    @secret_code.each_with_index.reduce("") do |advice, (color, index)|
      if gues.include?(color)
        if gues[index] == color
          advice += "W"
        else
          advice += "V"
        end
      else
        advice += "O"
      end
    end
  end

  def check_for_wictory(gues, person)
    if @secret_code == gues
      puts "#{person} won..."
      "end"
    end
  end

  def check_gues(gues)
    valid = true
    if gues.empty? == true
        valid = false
    else
      gues.each do |color|
        unless color == "r" || color == "b" || color == "g" || color == "y"
          puts "This color code isn't valid. Try again."
          valid = false
        end
      end
    end
    valid
  end

  def change_code
    puts "Enter secret code (r b g y):"
    code = gets.chomp.split(" ")
    @secret_code = code
  end
end