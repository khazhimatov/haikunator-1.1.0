require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-")
      seed = random_seed

      build(seed, token_range, delimiter)
    end

    private

    def build(seed, token_range, delimiter)
      sections = [
        adjectives[seed % adjectives.length],
        nouns[seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      (SecureRandom.random_number * (2**12)).floor
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        осенний скрытый горький смутный тихий пустой сухой темный летний
        ледяной короткий громкий дивный долгий лесной вечерний морозный
        крутой мирный синий тонкий толстый красный одинокий
        высокий сложный косой низкий вкусный зеленый шумный белый весенний
        жирный большой плохой милый приятный старый колючий круглый бурый
        ночной уютный небесный летающий крепкий хилый черный
        молодой квадратный трезвый видный новый снежный гордый цветной
        сильный дикий чистый слабый сладкий свежий анонимный
      )
    end

    def nouns
      %w(
        водопад лед ветер лев дождь дух океан вечер
        снег плот закат стул плащ лист рассвет блеск лес
        холм град луг день ящик стол ручей восход
        куст ковер плач зор пожар цветок жук пух город
        туман архив вечер пруд мрак сопог котел
        звук климат образ шар гриб чай кофе камень
        сигнал дом комод восход ботинок сон банан сахар сок
        мороз голос фон торт дым король
      )
    end
  end
end
