require 'pry'

class MeanLogger
  def call(env)
    if !env['REQUEST_METHOD'].nil? && (env['REQUEST_METHOD'] != 'GET')
      log(env['rack.input'].read)
    end

    [200, { 'Content-Type' => 'text/plain'}, [index]]
  end

  private

  def index
    if File.exists?('./log.txt')
      File.read('./log.txt')
    else
      ''
    end
  end

  def log(msg = '<no msg sent>')
    current_content = index

    header = "---- ##### #{Time.now} ##### ----"
    entry = "#{header}\n#{msg}"

    File.open('./log.txt', 'wb') do |f|
      f.write current_content.append(entry + "\n\n\n")
    end
  end
end

run MeanLogger.new
