replace pid = "1" if pid == "P001"
replace pid = "2" if pid == "P002"
replace pid = "3" if pid == "P004"
replace pid = "4" if pid == "P005"
replace pid = "5" if pid == "P006"
replace pid = "6" if pid == "P007"
replace pid = "7" if pid == "P008"
replace pid = "8" if pid == "P010"
replace pid = "9" if pid == "P011"
replace pid = "10" if pid == "P012"
replace pid = "11" if pid == "P013"
replace pid = "12" if pid == "P015"
replace pid = "13" if pid == "P022"
replace pid = "14" if pid == "P023"
replace pid = "15" if pid == "P024"
replace pid = "16" if pid == "P025"
replace pid = "17" if pid == "P030"
replace pid = "18" if pid == "P031"
replace pid = "19" if pid == "P034"
replace pid = "20" if pid == "P035"
replace pid = "21" if pid == "P036"
replace pid = "22" if pid == "P037"
replace pid = "23" if pid == "P040"
replace pid = "24" if pid == "P042"
replace pid = "25" if pid == "P043"
replace pid = "26" if pid == "P044"
replace pid = "27" if pid == "P045"
replace pid = "28" if pid == "P048"
replace pid = "29" if pid == "P051"
replace pid = "30" if pid == "P055"
replace pid = "31" if pid == "P056"
replace pid = "32" if pid == "P058"
replace pid = "33" if pid == "P059"
replace pid = "34" if pid == "P061"
replace pid = "35" if pid == "P062"
replace pid = "36" if pid == "P063"
replace pid = "37" if pid == "P067"
replace pid = "38" if pid == "P068"
replace pid = "39" if pid == "P069"
replace pid = "40" if pid == "P079"
replace pid = "41" if pid == "P080"
replace pid = "42" if pid == "P084"
replace pid = "43" if pid == "P085"
replace pid = "44" if pid == "P091"
replace pid = "45" if pid == "P094"
replace pid = "46" if pid == "P095"
replace pid = "47" if pid == "P096"
replace pid = "48" if pid == "P097"
replace pid = "49" if pid == "P098"
replace pid = "50" if pid == "P099"
replace pid = "51" if pid == "P105"
replace pid = "52" if pid == "P106"
replace pid = "53" if pid == "P109"
replace pid = "54" if pid == "P111"
replace pid = "55" if pid == "P118"
replace pid = "56" if pid == "P119"
replace pid = "57" if pid == "P126"
replace pid = "58" if pid == "P131"
replace pid = "59" if pid == "P145"
replace pid = "60" if pid == "P505"
replace pid = "61" if pid == "P519"
replace pid = "62" if pid == "P538"
replace pid = "63" if pid == "P540"
replace pid = "64" if pid == "P546"
replace pid = "65" if pid == "PO78"
replace pid = "66" if pid == "P017"
replace pid = "67" if pid == "P018"
replace pid = "68" if pid == "P019"
replace pid = "69" if pid == "P020"
replace pid = "70" if pid == "P026"
replace pid = "71" if pid == "P027"
replace pid = "72" if pid == "P028"
replace pid = "73" if pid == "P029"
replace pid = "74" if pid == "P060"
replace pid = "75" if pid == "P064"
replace pid = "76" if pid == "P065"
replace pid = "77" if pid == "P070"
replace pid = "78" if pid == "P088"
replace pid = "79" if pid == "P090"
replace pid = "80" if pid == "P100"
replace pid = "81" if pid == "P101"
replace pid = "82" if pid == "P102"
replace pid = "83" if pid == "P103"
replace pid = "84" if pid == "P122"
replace pid = "85" if pid == "P123"
replace pid = "86" if pid == "P124"
replace pid = "87" if pid == "P125"
replace pid = "88" if pid == "P127"
replace pid = "89" if pid == "P129"
replace pid = "90" if pid == "P130"
replace pid = "91" if pid == "P135"
replace pid = "92" if pid == "P142"
replace pid = "93" if pid == "P144"
replace pid = "94" if pid == "P146"
replace pid = "95" if pid == "P147"
replace pid = "96" if pid == "P149"
replace pid = "97" if pid == "P150"
replace pid = "98" if pid == "P152"
replace pid = "99" if pid == "P156"
replace pid = "100" if pid == "P158"
replace pid = "101" if pid == "P159"
replace pid = "102" if pid == "P163"
replace pid = "103" if pid == "P168"
replace pid = "104" if pid == "P171"
replace pid = "105" if pid == "P172"
replace pid = "106" if pid == "P173"
replace pid = "107" if pid == "P174"
replace pid = "108" if pid == "P176"
replace pid = "109" if pid == "P177"
replace pid = "110" if pid == "P178"
replace pid = "111" if pid == "P179"
replace pid = "112" if pid == "P180"
replace pid = "113" if pid == "P181"
replace pid = "114" if pid == "P182"
replace pid = "115" if pid == "P192"
replace pid = "116" if pid == "P193"
replace pid = "117" if pid == "P197"
replace pid = "118" if pid == "P198"
replace pid = "119" if pid == "P199"
replace pid = "120" if pid == "P203"
replace pid = "121" if pid == "P137"
replace pid = "122" if pid == "P502"
replace pid = "123" if pid == "P506"
replace pid = "124" if pid == "P507"
replace pid = "125" if pid == "P511"
replace pid = "126" if pid == "P512"
replace pid = "127" if pid == "P513"
replace pid = "128" if pid == "P514"
replace pid = "129" if pid == "P515"
replace pid = "130" if pid == "P516"
replace pid = "131" if pid == "P521"
replace pid = "132" if pid == "P522"
replace pid = "133" if pid == "P524"
replace pid = "134" if pid == "P535"
replace pid = "135" if pid == "P539"
replace pid = "136" if pid == "P547"

destring pid, replace

label define pid 1 "P001"	2"P002"	3"P004"	4"P005"	5"P006"	6"P007"	7"P008"	8"P010"	9"P011"	10"P012"	11"P013"	12"P015"	13"P022"	14"P023"	15"P024"	16"P025"	17"P030"	18"P031"	19"P034"	20"P035"	21"P036"	22"P037"	23"P040"	24"P042"	25"P043"	26"P044"	27"P045"	28"P048"	29"P051"	30"P055"	31"P056"	32"P058"	33"P059"	34"P061"	35"P062"	36"P063"	37"P067"	38"P068"	39"P069"	40"P079"	41"P080"	42"P084"	43"P085"	44"P091"	45"P094"	46"P095"	47"P096"	48"P097"	49"P098"	50"P099"	51"P105"	52"P106"	53"P109"	54"P111"	55"P118"	56"P119"	57"P126"	58"P131"	59"P145"	60"P505"	61"P519"	62"P538"	63"P540"	64"P546"	65"PO78"	66"P017"	67"P018"	68"P019"	69"P020"	70"P026"	71"P027"	72"P028"	73"P029"	74"P060"	75"P064"	76"P065"	77"P070"	78"P088"	79"P090"	80"P100"	81"P101"	82"P102"	83"P103"	84"P122"	85"P123"	86"P124"	87"P125"	88"P127"	89"P129"	90"P130"	91"P135"	92"P142"	93"P144"	94"P146"	95"P147"	96"P149"	97"P150"	98"P152"	99"P156"	100"P158"	101"P159"	102"P163"	103"P168"	104"P171"	105"P172"	106"P173"	107"P174"	108"P176"	109"P177"	110"P178"	111"P179"	112"P180"	113"P181"	114"P182"	115"P192"	116"P193"	117"P197"	118"P198"	119"P199"	120"P203"	121"P137"	122"P502"	123"P506"	124"P507"	125"P511"	126"P512"	127"P513"	128"P514"	129"P515"	130"P516"	131"P521"	132"P522"	133"P524"	134"P535"	135"P539"	136"P547"
label values pid pid