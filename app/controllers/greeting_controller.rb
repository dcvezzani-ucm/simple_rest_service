class GreetingController < ApplicationController
  def hello
    greeting = Greeting.new
    greeting.phrase = "how are you doing?"

    @greetings = [greeting]
  end

  def test
    if(request.headers['HTTP_BLAH'])
      blah = request.headers['HTTP_BLAH']
      puts ">>> header: #{blah}"
      response.headers['HTTP_RESPONSE_BLAH'] = "response-#{blah}"
    end

    # debugger
    if(cookies[:blah])
      puts ">>> cookie: #{blah}"
      cookies[:blah] = "response-#{cookies[:blah]}"
    end
  end

  def shake
    greeting = Greeting.new
    greeting.phrase = "nice to meet you"

    if(request.headers['HTTP_SUGAR'])
      cookies[:blah] = "#{request.headers['HTTP_SUGAR']}-cookie"
    end

    @greetings = [greeting]

    render action: :hello
  end
end
