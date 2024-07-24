require "chatgpt/client"

class Openai
  CLIENT = ChatGPT::Client.new(ENV["OPENAI_KEY"])

  def self.get_intro(conversations)
    messages = [
      { "role": "system", "content": "You are professional sales." },
      { "role": "user", "content": "I am writing intro of product" },
      { "role": "user",
        "content": "Please use provided information below, and rephrase it as a nice article" },
      { "role": "user", "content": conversations }
    ]

    @openai_log = OpenaiLog.create!(
      api: "/v1/chat/completions",
      model: "gpt-3.5-turbo",
      params: messages
    )

    res = CLIENT.chat(messages)
    @openai_log.update(response: res)
    res["choices"][0]["message"]["content"]
  end
end
