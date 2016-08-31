require 'sinatra'


def create_table(number)
	possibles = [1,2,3,4,5,6,7,8,9,10,11,12]
	int_set = possibles.shuffle
	result = []
	@answer_list = [0]
	while int_set.length > 0
		random_int = int_set[0]
		string = (number.to_s + " x " + random_int.to_s)
		int_set.delete(random_int)
		if (random_int.to_s).length == 1
			string += " &nbsp;&nbsp;= ----------------------------"
		else
			string += " &nbsp;= ----------------------------"
		end
		result << string
		@answer_list << random_int.to_i * number.to_i
	end
	@answer_list << 1
	return result
end



get '/' do
	@greeting = "Hi! Enter a number to generate a quick test."
	erb :index
end

post '/results' do
	@user_answers = params[:user_answer0] + " " + params[:user_answer1] + " " + params[:user_answer2] + " "  + params[:user_answer3] + " " + params[:user_answer4] + " " + params[:user_answer5] + " " + params[:user_answer6] + " " + params[:user_answer7] + " " + params[:user_answer8] + " " + params[:user_answer9] + " " + params[:user_answer10] + " " + params[:user_answer11]
	@user_integer = params[:integer]
	@answers = params[:true_answers]
	erb :results

end

post '/' do
	@multiplication_table = create_table(params[:int_to_generate])
	@integer = params[:int_to_generate]
	@answers = @answer_list
	erb :multiplication_table_page
end



