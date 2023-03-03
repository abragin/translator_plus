module KaTransliteration
  LAT_KA_TABLE = {
    "a"    =>  "ა",
    "k'"   =>  "კ",
    "t'"   =>  "ტ",
    "dz"   =>  "ძ",
    "b"    =>  "ბ",
    "l"    =>  "ლ",
    "u"    =>  "უ",
    "ts'"  =>  "წ",
    "g"    =>  "გ",
    "m"    =>  "მ",
    "p"    =>  "ფ",
    "f"    =>  "ფ",
    "ch'"  =>  "ჭ",
    "d"    =>  "დ",
    "n"    =>  "ნ",
    "k"    =>  "ქ",
    "kh"   =>  "ხ",
    "x"    =>  "ხ",
    "e"    =>  "ე",
    "o"    =>  "ო",
    "gh"   =>  "ღ",
    "j"    =>  "ჯ",
    "v"    =>  "ვ",
    "w"    =>  "ვ",
    "p'"   =>  "პ",
    "q"    =>  "ყ",
    "h"    =>  "ჰ",
    "z"    =>  "ზ",
    "zh"   =>  "ჟ",
    "sh"   =>  "შ",
    "t"    =>  "თ",
    "r"    =>  "რ",
    "ch"   =>  "ჩ",
    "i"    =>  "ი",
    "s"    =>  "ს",
    "ts"   =>  "ც",
    "c"    =>  "ც"
  }

  LAT_KA_KEYS_SORTED = LAT_KA_TABLE.keys.sort_by{ |k| -k.size}

  def transliterate(str)
    str = str.downcase
    res = ""
    while str.present?
      has_progress = false
      for k in LAT_KA_KEYS_SORTED
        if str.starts_with?(k)
          res += LAT_KA_TABLE[k]
          str = str[k.size..]
          has_progress = true
          break
        end
      end
      if !has_progress && str.present?
        #binding.pry
        res += str[0]
        str = str[1..]
      end
    end
    return res

  end

end
