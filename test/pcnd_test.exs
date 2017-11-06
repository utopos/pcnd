defmodule PCNDGenitiveTest do
  use ExUnit.Case
  doctest PCND.Genitive

  test "genitive cardinals <=10" do
    assert PCND.Genitive.generate_gen(1) == "jednego"
    assert PCND.Genitive.generate_gen(5) == "pięciu"
    assert PCND.Genitive.generate_gen(6) == "sześciu"
    assert PCND.Genitive.generate_gen(7) == "siedmiu"
    assert PCND.Genitive.generate_gen(8) == "ośmiu"
    assert PCND.Genitive.generate_gen(9) == "dziewięciu"
    assert PCND.Genitive.generate_gen(10) == "dziesięciu"
  end

  test "genitive cardinals (10,20) " do
    assert PCND.Genitive.generate_gen(11) == "jedenastu"
    assert PCND.Genitive.generate_gen(12) == "dwunastu"
    assert PCND.Genitive.generate_gen(13) == "trzynastu"
    assert PCND.Genitive.generate_gen(14) == "czternastu"
    assert PCND.Genitive.generate_gen(15) == "piętnastu"
    assert PCND.Genitive.generate_gen(16) == "szesnastu"
    assert PCND.Genitive.generate_gen(17) == "siedemnastu"
    assert PCND.Genitive.generate_gen(18) == "osiemnastu"
    assert PCND.Genitive.generate_gen(19) == "dziewiętnastu"
  end

  test "genitive cardinals (20,100) withou x1" do
    assert PCND.Genitive.generate_gen(22) == "dwudziestu dwóch"
    assert PCND.Genitive.generate_gen(33) == "trzydziestu trzech"
    assert PCND.Genitive.generate_gen(44) == "czterdziestu czterech"
    assert PCND.Genitive.generate_gen(55) == "pięćdziesięciu pięciu"
    assert PCND.Genitive.generate_gen(66) == "sześćdziesięciu sześciu"
    assert PCND.Genitive.generate_gen(77) == "siedemdziesięciu siedmiu"
    assert PCND.Genitive.generate_gen(88) == "osiemdziesięciu ośmiu"
    assert PCND.Genitive.generate_gen(99) == "dziewięćdziesięciu dziewięciu"

  end

  test "genitive cardinals (20,100) with x1" do
    assert PCND.Genitive.generate_gen(31) == "trzydziestu jeden"
    assert PCND.Genitive.generate_gen(41) == "czterdziestu jeden"
    assert PCND.Genitive.generate_gen(51) == "pięćdziesięciu jeden"
    assert PCND.Genitive.generate_gen(61) == "sześćdziesięciu jeden"
    assert PCND.Genitive.generate_gen(71) == "siedemdziesięciu jeden"
    assert PCND.Genitive.generate_gen(81) == "osiemdziesięciu jeden"
    assert PCND.Genitive.generate_gen(91) == "dziewięćdziesięciu jeden"

  end


  test "genitive cardinals [100,1000) withou x1" do
    assert PCND.Genitive.generate_gen(122) == "stu dwudziestu dwóch"
    assert PCND.Genitive.generate_gen(133) == "stu trzydziestu trzech"
    assert PCND.Genitive.generate_gen(144) == "stu czterdziestu czterech"
    assert PCND.Genitive.generate_gen(155) == "stu pięćdziesięciu pięciu"
    assert PCND.Genitive.generate_gen(166) == "stu sześćdziesięciu sześciu"
    assert PCND.Genitive.generate_gen(177) == "stu siedemdziesięciu siedmiu"
    assert PCND.Genitive.generate_gen(188) == "stu osiemdziesięciu ośmiu"
    assert PCND.Genitive.generate_gen(199) == "stu dziewięćdziesięciu dziewięciu"

    assert PCND.Genitive.generate_gen(100) == "stu"
    assert PCND.Genitive.generate_gen(109) == "stu dziewięciu"
    assert PCND.Genitive.generate_gen(109) == "stu dziewięciu"

  end

  test "genitive cardinals >1000 withou x1" do
    assert PCND.Genitive.generate_gen(1000) == "tysiąca"
    assert PCND.Genitive.generate_gen(1100) == "tysiąca stu"
    assert PCND.Genitive.generate_gen(1114) == "tysiąca stu czternastu"
    assert PCND.Genitive.generate_gen(1102) == "tysiąca stu dwóch"
    assert PCND.Genitive.generate_gen(3102) == "trzech tysięcy stu dwóch"
    assert PCND.Genitive.generate_gen(1) == "jednego"
    assert PCND.Genitive.generate_gen(102000) == "stu dwóch tysięcy"
    assert PCND.Genitive.generate_gen(122000) == "stu dwudziestu dwóch tysięcy"
    assert PCND.Genitive.generate_gen(1122000) == "miliona stu dwudziestu dwóch tysięcy"
    assert PCND.Genitive.generate_gen(14122000) == "czternastu milionów stu dwudziestu dwóch tysięcy"
  end
end
