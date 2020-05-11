class CLI

  MAIN_URL = "https://www.scholarships.com/financial-aid/college-scholarships/scholarship-directory/academic-major"

  def call
    academic_majors
    puts "Welcome to Scholarship finder!"
    puts "\n"
    puts "You can type 'exit' anytime to exit from the app."
    intut = ""
    while input != "Exit"
      puts "Please enter academic major for the list of scholarship"
      
      input = gets.strip.capitalize
      if input == "Exit"
        puts "Thank you for using our app! Have a great day."
        break
      end
      scholarship_finder(input)
      puts "Please choose a number to see the details of scholarship"
      input_again = gets.strip.capitalize
      if input_again == "Exit"
        puts "Thank you for using our app! Have a great day."
        break
      end
      detail(input, input_again)
    end
  end

  def academic_majors
    major_list = Scraper.academic_major(MAIN_URL)
    Scholarship.major_finder(major_list)
  end

  def title_and_detail(scholarship_title)
    scholarship = Scraper.scholarship(scholarship_title)
    Title.title_finder(scholarship)
  end

  def scholarship_finder(input)
    url = Scholarship.all.detect {|e| e.major == input}.major_url
    i = 0
    title_and_detail(url).each do |e|
         i += 1
         puts "#{i}. #{e[:title]} - #{e[:amount]}"
    end
  end

  def detail(input, input_again)
    url = Scholarship.all.detect {|e| e.major == input}.major_url
    detail_url = title_and_detail(url)[input_again.to_i - 1][:scholarship_url]
    Scraper.detail(detail_url)
  end

end
