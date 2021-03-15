import '../models/medical.dart';
import '../models/content.dart';

const ContentData = const [
//placesToStay 1
  ContentClass(
    id: 'cl1_1',
    decrepitation:
        'If you want to be in the centre of all the amazing shopping, dining and entertainment Kuala Lumpur have to deliver, the Bukit Bintang area is the place to stay!',
    content:
        'You\'re close to everything here, including shopping malls, movie theatres, restaurants and a vibrant nightlife. Bukit Bintang has it all, whether you want to eat at fancy restaurants or cheap street food hawkers.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Bukit Bintang',
    locationUrl: 'https://goo.gl/maps/EfSdE1NwRrkDDSJe6',
  ),
  ContentClass(
    id: 'cl2_1',
    decrepitation:
        'The most famous place to stay in KL is Kuala Lumpur City Centre (KLCC), next to Bukit Bintang. This is where the renowned and spectacular Petronas Twin Towers are located.',
    content:
        'Many of the hotels in this area have views of the twin towers. If you are looking for top-end luxury hotels, high-end restaurants and more sophisticated nightlife. There is an entire cluster of upscale shopping malls here, the crown jewel being the Suria KLCC mall at the base of the towers.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Kuala Lumpur City Center – KLCC',
    locationUrl: 'https://goo.gl/maps/UtXud5hr2NMUEJRg6',
  ),
  ContentClass(
    id: 'cl3_1',
    decrepitation:
        'KL Sentral is a comfortable place to stay at, as it is home to KL Sentral Train Station, the main transport hub for KL. Quickly and easily access any part of the city, Thailand or Singapore.',
    content:
        'Connected to the KL Sentral Station, the large is NU Sentral Shopping Mall which houses hundreds of shops, restaurants, cafes, a convenience store, and a cinema.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'KL Sentral',
    locationUrl: 'https://goo.gl/maps/hJRcu7P3E6eDafR57',
  ),
  ContentClass(
    id: 'cl4_1',
    decrepitation:
        'If you prefer to stay a little outside of KL\'s busy and hectic downtown then Bangsar South might be just what you\'re looking for.',
    content:
        'Bangsar South is a quiet, upscale residential area at the outskirts of Kuala Lumpur, with modern highrise buildings. Lately, staying in it has become a trendy area, with plenty of top-notch restaurants, malls and large and posh supermarkets.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Bangsar South',
    locationUrl: 'https://goo.gl/maps/xpdRq39CumYs5hcM7',
  ),
  ContentClass(
    id: 'cl5_1',
    decrepitation:
        'Chinatown along Petaling Street offers plenty of budget and backpacker-style lodging options, making it a perfect place to meet and mingle with other travellers.',
    content:
        'Chinatown also has some of the best street food spots in the city that are mostly open day and night. The narrow streets, the ancient Chinese houses, the magnificent temples and the hustle and bustle make Chinatown a fascinating place to stay.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Chinatown (Petaling Street)',
    locationUrl: 'https://g.page/chinatown-kuala-lumpur?share',
  ),

//historicalPlaces 3
  ContentClass(
    id: 'cl1_3',
    decrepitation:
        'Prior to independence, this building housed the British administrative department. It was built in 1897 and was named after the reigning sultan of Selangor at the time.',
    content:
        'Constructed completely using bricks, the Sultan Abdul Samad building features heavy gothic, western and Moorish-style elements with an elegant porch, graceful arches, curved columns topped by polished copper cupolas and a 41.2m-high clock tower.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Raja, Kuala Lumpur City Centre, 50050 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/WoKipQu8KkA29Aoi7',
  ),
  ContentClass(
    id: 'cl2_3',
    decrepitation:
        'This building was built in 1892 and functioned as a wet market until the 1980s. It was later revamped and turned into a tourist attraction that sells local handicrafts.',
    content:
        'When you walk into Central Market, you can still feel the remnants of the history stuck to the tiles. Although it has been revamped and the interior does not look exactly like how it used to be, the historical value it holds is meant to be experienced.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'No. 10, 1st-3rd floor, Jalan Hang Kasturi',
    locationUrl: 'https://goo.gl/maps/h1wETNAuQkADUid19',
  ),
  ContentClass(
    id: 'cl3_3',
    decrepitation:
        'Located opposite the KL railway station is another Mughal masterpiece by Mr. Hubback.',
    content:
        'Built in 1917 for the railway company as an administrative building and still serves this purpose. Its northern wing was heavily damaged by bombs in the Second World War and by fire again in 1968.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Parlimen, Kuala Lumpur, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/AuC8zkXXwXaRiN1y7',
  ),
  ContentClass(
    id: 'cl4_3',
    decrepitation:
        'The National Monument is situated 50 metres across Jalan Tamingsabi, at the northern end of the Jalan Parlimen Lake Gardens. ',
    content:
        'The 15-metre-high bronze statue is dedicated to the 11,000 people who died in the First World War, battling the Japanese and the Malayan Emergency which lasted from 1948 to 1960. It is situated in the capital city of Kuala Lumpur.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Parlimen, Kuala Lumpur, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/eHpDA7XLvoKvKsbS8',
  ),
  ContentClass(
    id: 'cl5_3',
    decrepitation:
        'Dataran Merdeka was formerly known as the Selangor Club Padang or simply the Padang. It was used as the cricket green of the Selangor Club. ',
    content:
        'Located in front of Sultan Abdul Samad Building, Dataran Merdeka is undoubtedly Malaysia\'s best known venue. This is the essence of KL\'s past. The Union Flag was lowered and the Malayan flag was hoisted at this very spot at midnight on 31 August 1957 as Malaya declared independence from the British rule.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Raja, City Centre, 50050 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/z1hFQuuWN8tgrYiWA',
  ),

//parks 4
// need to add 2 more data Entry fee & tel number
  ContentClass(
    id: 'cl1_4',
    decrepitation:
        'This free and Instagrammable Park is just 3 kilometres away from the heart of Kuala Lumpur. The  Instagram worthy canopy walk is the most exciting part of the park! The 200 m canopy walk overlooks the forests and the nearby skyscrapers!',
    content:
        'The famous eco-tourism destination can be accessed in many ways! The easiest way is to drive. You can find private parking for around RM 10.00 in Jalan Raja Chulan which is just a stone’s throw from the park.',
    workhour: '7.00 am - 6.00 pm (Daily)',
    fees: 'Free ',
    phoneNo: '+603-20201606',
    locationText:
        'Kuala Lumpur, 50250 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/MRHQSXAkQn3F8FHR9',
  ),
  ContentClass(
    id: 'cl2_4',
    decrepitation:
        'If you are visiting the National Monument (Tugu Negara), you should not miss the ASEAN Sculpture Garden. It is a beautiful garden along Parlimen Road, about 100 meters from the National Monument and very close to Lake Gardens.',
    content:
        'The experience is better if you know more about the context behind each sculpture, as the details on the site are very scarce. The garden was formally opened for the commemoration of the 20th anniversary of ASEAN in 1987.',
    workhour: '-',
    fees: 'Free',
    phoneNo: '+6016-3337328',
    locationText:
        'ASEAN Sculpture Garden, Persiaran Sultan Salahuddin, Taman Tasik Perdana, 50480 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/ouKjLqYhL671MAro9',
  ),
  ContentClass(
    id: 'cl3_4',
    decrepitation:
        'KLCC Park was designed to combine man’s creation with nature. The park itself is a peaceful place in the middle of the hustle and bustle of the city.',
    content:
        'The park features a10,000 square metres man-made lake with water fountains. The main fountain can shoot water up to a height of 18 metres. At night, there are lights, music and fountains daily. It also has a jogging track and footpath, children playground and a paddling pool.',
    workhour: '7.00 am -10.00 pm (Daily) ',
    fees: 'Free',
    phoneNo: '-',
    locationText:
        'Jalan Ampang, Kuala Lumpur City Centre, 50088 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://g.page/klcc-park?share',
  ),
  ContentClass(
    id: 'cl4_4',
    decrepitation:
        'Though not as pretty as the other parks on our list, the Ampang Hilir Park still deserves to be part of this list. Why? This former tin mine boasts a lake with a diameter of 2.7 km, which makes it just perfect for a pleasant walk.',
    content:
        'Most days of the week, particularly during weekends, the park is filled with joggers and families alike. The Ampang Hilir Park might look smaller and \'less grand\' than the others in this list, but its picturesque lake and three separate playgrounds make the park unique.',
    workhour: '6.00 am - 8.00 pm (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Ampang Hilir (Jalan Kedondong) Ampang, Kuala Lumpur Malaysia',
    locationUrl: 'https://goo.gl/maps/4RXv6cvLXreLm48B6',
  ),
  ContentClass(
    id: 'cl5_4',
    decrepitation:
        'The Kepong Metropolitan Park, located at the northern end of Jinjang, is popular among locals for kite flying activities performed on a daily basis at this public facility.',
    content:
        'The park also consists of a 57-hectare man-made lake where anglers can test their skills, jogging and cycling, a children\'s playground, a boathouse, an observation tower, reflexology facilities, and an open area for kite enthusiasts and picnickers.',
    workhour: '6.00 am - 8.00 pm (Daily) ',
    fees: 'Free',
    phoneNo: '-',
    locationText:
        'Jalan Lingkaran Tengah 2, Kepong Metropolitan Lake-garden, 52100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/2EaktoudzTcGRXdd7',
  ),
  ContentClass(
    id: 'cl6_4',
    decrepitation:
        'The lake gardens comprise a jogging track, cycling track, kayaking, horse riding facility, radio control car racing track etc.',
    content:
        'The Titiwangsa Park is situated 95 hectares northeast of Titiwangsa Station. 57 hectares of the park consists of a lake that is a by-product of tin mining during the British occupation.',
    workhour: '7.00 am - 7.00 pm (Daily)',
    fees: 'Free',
    phoneNo: '+603-26176273',
    locationText:
        'Taman Tasik Titiwangsa, Tasik, Titiwangsa, 53200 Kuala Lumpur',
    locationUrl: 'https://g.page/taman-tasik-titiwangsa?share',
  ),
  ContentClass(
    id: 'cl7_4',
    decrepitation:
        'The 40 hectares urban park situated in the Bandar Tun Razak district of Kuala Lumpur. There are shady picnic spots around the lake with concrete tables and stools provided.',
    content:
        'It features a scenic lake at its centre. Located about 6 km from the city centre at Bandar Tun Razak. ',
    workhour: '6.00 am - 8.00 pm  (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Tasik Permaisuri 2, Bandar Tun Razak, 56000 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/AtAEwmyX68TkUAjQ8',
  ),
  ContentClass(
    id: 'cl8_4',
    decrepitation:
        'Putrajaya Botanical Gardens is situated 25 km south of Kuala Lumpur. Although the park is not directly within the city of Kuala Lumpur, it is also one of the must-see attractions if you\'re around KL.',
    content:
        'The park also encourages visitors to hire bicycles for a bike ride or hop on a boat or tram for an enjoyable ride. There are also a few good spots for picnics.',
    workhour:
        '9.00 am - 12.00 pm; 2.00 pm - 5.00 pm \n(Sat - Mon)\n9.00 am - 12.00 pm; 2.00 pm - 5.00 pm \n(Wed & Thur) \n9.00 am - 11.00 am; 3.00 pm - 5.00 pm \n(Fri) \nClosed on Tuesday',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Lebuh Perdana Barat, Presint 1, 62000 Putrajaya, Wilayah Persekutuan Putrajaya',
    locationUrl: 'https://goo.gl/maps/ToEyFjXX2UfNE7az5',
  ),
  ContentClass(
    id: 'cl9_4',
    decrepitation:
        'The park is the ideal place for you to have a picnic overlooking the scenic lake, or to get your heart powered by hitting the jogging track. Take a leisurely walk and enjoy the great outdoors with beautiful views.',
    content:
        'The park is the ideal place for you to have a picnic overlooking the scenic lake, or to get your heart powered by hitting the jogging track. Take a leisurely walk and enjoy the great outdoors with beautiful views. The cherry on the cake is that the park is one of the several pet-friendly locations in KL.',
    workhour: '6.00 am - 11.00 pm (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'C-3-1 Plaza Arkadia, 3, Persiaran Residen, Desa Parkcity, 52200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur ',
    locationUrl: 'https://goo.gl/maps/gYwH7WdJutF2WTsg6',
  ),
  ContentClass(
    id: 'cl10_4',
    decrepitation:
        'Bukit Kiara Park is surrounded by nature, which is enjoyed by people of all walks of life and home to many wild plants , birds, monkeys and other animals.',
    content:
        'The 5 km jogging trail is pretty challenging. The hill path requires some effort and determination to reach the top that is approximately 250 m above sea level. It\'s tiring, but the top view is worth the hike!',
    workhour: 'Open 24 hours (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Bukit Kiara Trail, Sungai Penchala, 60000 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/T8fkzRYjJ9C8as3m8',
  ),

//Spa 5
//Need to add tel number
  ContentClass(
    id: 'cl1_5',
    decrepitation:
        'Ozmosis Fitness & Day Spa is the ideal place for men and women seeking to refresh their bodies, minds and souls.',
    content:
        'Ozmosis Fitness & Day Spa is a serene haven situated right in the heart of Bangsar Baru, adopting the concept of a Balinese spa where calm prevails and all five senses are awakened and refreshed.',
    workhour: '10.00 am - 9.00 pm (Mon - Sun) ',
    fees: '-',
    phoneNo: '+603-22870380',
    locationText:
        '16-1, Jalan Telawi 2, Bangsar, 59100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/OzmosisSpaBangsar?share',
  ),
  ContentClass(
    id: 'cl2_5',
    decrepitation:
        'Nestled in the heart of Kuala Lumpur in Fahrenheit 88, Luxurious Spa provides a holistic paradise for those willing to escape the tedium of everyday life.',
    content:
        'Customers can take a dip in the outdoor swimming pool, relax in the Jacuzzi or carry out an invigorating workout in a professionally fitted gym, before indulging in the skills of professional therapists for a soothing massage or a mani-pedi service. Other facilities offered include a movie theatre, a lounge and a café serving foreign cuisine to soak up appetites between sampling sessions.',
    workhour: '24 Hours (Daily)',
    fees: '-',
    phoneNo: '+603-21485888',
    locationText:
        'Lot 5-02-06, 179, Jalan Gading, Bukit Bintang, 55100 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/Gn427GNsEJEYQNc77',
  ),
  ContentClass(
    id: 'cl3_5',
    decrepitation:
        'Ossoto Spa KL is the best place to treat yourself without breaking your wallet. This intimate spa is located deep in the heart of Kuala Lumpur.',
    content:
        'It is a 24-hour spa with just one entrance charge, but there are additional facilities such as manicures and massages. Other than that, you should take advantage of all the spa facilities, get all the coffee, use all the internet and eat all the food you need for 24 hours.',
    workhour: '24 hours (Daily) ',
    fees: '-',
    phoneNo: '+603-21459933',
    locationText:
        'Wisma Mirama, Jalan Wisma Putra, Kampung Attap, 50460 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/dewGmyZf9tawhDhXA',
  ),
  ContentClass(
    id: 'cl4_5',
    decrepitation:
        'Swasana Spa provides a range of seven body massages in the form of traditional Balinese, Thai and Malaysian treatments.',
    content:
        'Swasana Spa has been accredited as a 5-star resort by the Ministry of Tourism of Malaysia, the recipient of the World Luxury Spa Award and several other awards.',
    workhour: '10.00 am - 10.00 pm (Mon - Sun)',
    fees: '-',
    phoneNo: '+603-21471111',
    locationText:
        'Impiana @ Klcc Hotel, No. 13, Jalan Pinang, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan',
    locationUrl: 'https://goo.gl/maps/6nVjzutv333RFHup6',
  ),
  ContentClass(
    id: 'cl5_5',
    decrepitation:
        'Located within Anggun Hotel, the spa offers a wide range of massage treatments along with facials and manicures.',
    content:
        'All you need to do is select the treatment that best fits your needs and allow the skilled masseurs and masseuses of Alam to take care of you. You\'re sure to wake up feeling refreshed and ready to conquer Kuala Lumpur!',
    workhour: '12.00 pm - 12.00 am (Daily)',
    fees: '-',
    phoneNo: '+6019-2120639',
    locationText: '9, Tengkat Tong Shin, Bukit Bintang, 55100 Kuala Lumpur.',
    locationUrl: 'https://goo.gl/maps/y1GEjwJ1m68P99Qy5',
  ),
  ContentClass(
    id: 'cl6_5',
    decrepitation:
        'The Uroot Spa is one of the best massage spa in Malaysia\'s capital, Kuala Lumpur. It offers a wide range of local relaxation methods that will relieve the muscles in order to have a peaceful sleep.',
    content:
        'Their massages are designed to treat you with gentle strokes to relieve insomnia and to induce deep sleep. Their in-house essential oil in the spa will relax the body to recover from the jet lag. In the end, it will make it possible for the body to remain healthy, smooth and balanced.',
    workhour: '11.00 am - 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+6017-8813990',
    locationText:
        'LG1-5, Lower Ground 1, Arcoris, 10, Jalan Kiara, Mont Kiara, 50480 Kuala Lumpur',
    locationUrl: 'https://g.page/UrootSpaMK?share',
  ),
  ContentClass(
    id: 'cl7_5',
    decrepitation:
        'Indulge in aromatherapy, body scrubs, facials, hot stone and herbal compression treatments, and more. ',
    content:
        'Ideal for those looking for a quiet retreat or couples and friends who want to share a wonderful experience together. Bali Ayu Spa Sanctuary specialises in detoxification and lymphatic treatment as well as muscle relaxation and general massage.',
    workhour: '10.00 am - 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-20944557',
    locationText:
        '57, Jalan Bangkung, Bangsar, 59100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/uhNWBvb6NmdL3d9cA',
  ),
  ContentClass(
    id: 'cl8_5',
    decrepitation:
        'With 18 branches in the malls and hypermarkets across KL and Klang Valley, Manjakaki has become one of the most convenient spas.',
    content:
        'If you need to take a break while shopping and relaxing, you don\'t need to go any further. The spa provides a wide variety of treatments, from various styles of massages to body scrubs and manicures and pedicures.',
    workhour: '10.00 am - 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+6017-8779912',
    locationText:
        'Mid Valley Megamall, Lot No.2, LG, 59, Lingkaran Syed Putra, Mid Valley City, 59200 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/G9TbuVJpCB3k1V5G6',
  ),
  ContentClass(
    id: 'cl9_5',
    decrepitation:
        'Erawan Wellness offers relaxation in the form of a variety of aromatic enclosure massages. Customers can request different types of massage and target areas.',
    content:
        'Offering immersive experiences that provide a quick break from daily stress, the spa is the perfect place to visit for authentic Thai massages. Masseuses here are well-trained and strong, so don\'t be surprised when they apply strong pressure to ease the pain in your troubled areas. \n\nDisclaimer : This place is temporarily closed.',
    workhour: '10.00 am - 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-41628699',
    locationText:
        'L6-19 Melawati Mall, 355 Jalan Bandar Melawati, Pusat Bandar Melawati, 53100 Kuala Lumpur, Selangor',
    locationUrl: 'https://goo.gl/maps/WaGvDtJmRMQixwjB8',
  ),
  ContentClass(
    id: 'cl10_5',
    decrepitation:
        'Though Thai massages give you intense and pleasant relaxation, Chinese massage is a gentler way to treat chronic problems and calming tension in your body.',
    content:
        'Reborn is well known for its foot massages and Tui Na treatments that offer instant body rejuvenation. If you want your massage to be less painful, you might want to pay a visit to this spa, where traditional acupressure is used to heal and restore balance to your body.',
    workhour: '11.00 am - 1.00 am (Daily)',
    fees: '-',
    phoneNo: '+603-90571099',
    locationText:
        '29-2, Jalan Radin Anum, Sri Petaling, 57000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/WczKLdxcfJicRbM98',
  ),
//klForKids 6
  ContentClass(
    id: 'cl1_6',
    decrepitation:
        'The Pusat Sains Negara or the National Science Center is located on the top of a hill on 8 hectares of landscaped grounds in Bukit Kiara, Kuala Lumpur.',
    content:
        'The structure looks like a truncated cone topped with a geodesic dome. The themes used in the exhibition galleries include environmental odyssey, exploration routes, the future of the earth, and thought machines. The centre has a digital library, a science lab, three classrooms, two auditoriums and a multipurpose space.',
    workhour: '9.00 am - 4.00 pm (Sun - Thu)',
    fees: '-',
    phoneNo: '+603-20893400',
    locationText:
        'Persiaran Bukit Kiara Bukit Damansara, Bukit Kiara, 50662 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/fpouoVXvTCiG2D8t9',
  ),
  ContentClass(
    id: 'cl2_6',
    decrepitation:
        'KL Tower Upside Down House is one of the newest attractions in KL Tower. It was designed with a \'Cottage House\' theme, with an antique \'Morris 1974\' hanging upside down at the entrance. ',
    content:
        'Inside, visitors can explore a number of rooms that they’d find in a real house, including kitchen, living room, master bedroom and an attic – all upside down, of course. Depending on how long you need to pose for photos, a visit here takes between 30 minutes to an hour.',
    workhour: '10.00 am - 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-50319458',
    locationText:
        'SB-1, Sunsuria Forum, No.1, Jalan Setia Dagang AL U13/AL, Seksyen U13, Setia Alam, 40170 Shah Alam, Selangor',
    locationUrl: 'https://goo.gl/maps/LtuUHLMBwUkYXRKP9',
  ),
  ContentClass(
    id: 'cl3_6',
    decrepitation:
        'The National Planetarium is dedicated to all aspects of science and astronomy. It\'s a fun and educational place for children to learn about the planets and galaxies. ',
    content:
        'The National Planetarium might not be as high tech as the other planetariums around the world, but it still deserves a visit. The main entrance is evocative of a teleport chamber, which leads to a series of halls containing two planetaries with interactive exhibits and a Space Theater.',
    workhour: '9.00 am - 4.30 pm (Tues - Sun)',
    fees: '-',
    phoneNo: '+603-20205444',
    locationText:
        '53, Jalan Perdana, Tasik Perdana, 50480 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/cswKxyp4SUG8ndE26',
  ),
  ContentClass(
    id: 'cl4_6',
    decrepitation:
        'KL Tower Mini Zoo (KLTMZ) is the newest petting zoo in Malaysia. Located at the bottom of the KL Tower, KLTMZ has more than 50 species of animals.',
    content:
        'If you are looking for kid-friendly places in KL, KL Tower Mini Zoo should be on your list. A wide variety of exotic animals can be found here, ranging from large python monkeys to cuddly rabbits.',
    workhour: '10.00 am - 9.00 pm (Daily) ',
    fees: '-',
    phoneNo: '+603-20223943',
    locationText:
        'Ground Floor, Menara Kuala Lumpur, WP, Jalan Puncak, 50250 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/i3Jwd9KvL129q3A2A',
  ),
//localFood 17
  ContentClass(
    id: 'cl1_17',
    decrepitation:
        'This is Malaysia\'s most traditional and popular food you NEED to try this country, only full stomach but inexpensive, it can be found in any dining area.',
    content:
        'A pack of nasi lemak can cost as low as RM1.50 and go up to RM30 depending where are you are getting you nasi lemak fix. There are other side dishes you can add on to your nasi lemak ranging from something as simple as chicken curry to beef lung sambal (this varies from seller to seller).',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        '● Nasi Lemak Wanjo Kg Baru \n●	Nasi Lemak Antarabangsa \n● Nasi Lemak Tanglin ',
    locationUrl:
        'https://www.google.com/maps/d/edit?mid=1T6ORLdDJwsJF0Ky76msAjJgtlBwn56e9&usp=sharing',
  ),
  ContentClass(
    id: 'cl2_17',
    decrepitation:
        'Banana leaf rice is a traditional method of serving rice dishes in South Indian cuisine. Whenever food is served on a banana leaf it is sure to give you a foodgasm.',
    content:
        'A traditional banana leaf meal is served with white rice (or parboiled rice in authentic South Indian restaurants) with a variety of vegetables, pickles, appalam (crispy cracker) and other regional condiments (usually sour, salty, or spicy)',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        '● Southern Spice Banana Leaf \n     Restaurant Changkat KL \n● Restoran Devi’s Corner \n● KK Banana Leaf Dine ',
    locationUrl:
        'https://www.google.com/maps/d/edit?mid=1MyrKpPKqMZ0q6pk1Pe2EDsvYug8RX8vU&usp=sharing',
  ),
  ContentClass(
    id: 'cl3_17',
    decrepitation:
        'Nasi kandar is a popular dish from the north of Malaysia, originating from Penang. It is a steamed rice meal that can be flavoured plain or mildly and served with a variety of curries and side dishes. ',
    content:
        'Nasi kandar is typically served on a single plate side dishes such as fried chicken, curried spleen, cubed beef, lamb, fish roe, fried prawns or fried squid. ',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        '● Mohd.Yaseem Nasi Kandar Restaurant \n● Restoran Kudu Bin Abdul \n● Nasi Kandar Penang',
    locationUrl:
        'https://www.google.com/maps/d/edit?mid=1zeua9AViTf-KWuhUlVUddOlY0PfUPrTk&usp=sharing',
  ),
  ContentClass(
    id: 'cl4_17',
    decrepitation:
        'Yes, we have our McDonald\'s (Mekdi) and KFC, but we Malaysians still have our love for street burgers, which is part of our guilty pleasure! This is the most affordable burger stall you can find.',
    content:
        'The street burger can be ordered as it is (burger patty sandwiched between two buns, cucumber slices, mayonnaise, ketchup or chilli sauce) or it can go as fancy as adding an egg and a slice of cheese.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        '● Dhuha kirana San Peng Street Burger \n● Kaw Kaw Burger Wangsa Maju \n● Bergeger Street Burger Stall',
    locationUrl:
        'https://www.google.com/maps/d/edit?mid=1LnyFQJPw4fTvUkbKtJaM8pjqfaQcFesR&usp=sharing',
  ),
  ContentClass(
    id: 'cl5_17',
    decrepitation:
        'Similar to paratha in India, roti canai is made of wheat flour and egg. Iti is a popular Malaysian breakfast and snack dish, and one of Malaysia’s Indian cuisine\'s most celebrated examples.',
    content:
        'It is said that Indian Muslims, also known as "Mamaks" in Malaysia, brought the dish over from India and served at Mamak stalls located in both rural and urban Malaysia. The roti canai is best served with dhal (lentil curry), chicken curry or fish curry.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText:
        '● Lan Roti Canai \n● Valentine Roti (The Best Roti Canai) \n● Mansion Tea Stall ',
    locationUrl:
        'https://www.google.com/maps/d/edit?mid=16W9HPMYM6aPc0LHU7bT7u2GUJyQbAtVt&usp=sharing',
  ),

//whatToDoInKl 10
  ContentClass(
    id: 'cl1_10',
    decrepitation: '-',
    content:
        'Nasi Lemak is fragrant rice traditionally cooked in coconut milk and screwpine (pandan) leaves. It is served with spicy sambal, cucumbers, fried anchovies, egg and fried groundnuts.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl2_10',
    decrepitation: '-',
    content:
        'Visit the National Museum to learn more about Malaysia\'s history and culture. Local resources and national costumes are also on display. There are also temporary exhibitions that rotate throughout the year.',
    workhour: '9.00 am - 5.00 pm (Tue - Sun)',
    fees: '-',
    phoneNo: '+603-22671000',
    locationText:
        'Jabatan Muzium Malaysia, Jalan Damansara, Perdana Botanical Gardens, 50566 Kuala Lumpur, Federal Territory of Kuala Lumpur ',
    locationUrl: 'https://g.page/national-museum-of-malaysia?share',
  ),
  ContentClass(
    id: 'cl3_10',
    decrepitation: '-',
    content:
        'Taman Eko Rimba Kuala Lumpur is one of Malaysia\'s oldest forests. Located in Hutan Simpan Bukit Nanas, one of the oldest forests in Malaysia.  Taman Eko Rimba Kuala Lumpur Is FREE & Instagram-worthy!',
    workhour: '8.00 am - 6.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-20264741',
    locationText:
        'Kuala Lumpur, 50250 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/LHLmPBtJQWzW8bqPA',
  ),
  ContentClass(
    id: 'cl4_10',
    decrepitation: '-',
    content:
        'Petaling Street also known as Chinatown by locals. The street food vendors that set up here at night are particularly popular. The street is also well known for its counterfeit goods that are priced dirt-cheap.',
    workhour: '24 Hours',
    fees: '-',
    phoneNo: '+603-20325988',
    locationText:
        'Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur ',
    locationUrl: 'https://g.page/petaling-street-market?share',
  ),
  ContentClass(
    id: 'cl5_10',
    decrepitation: '-',
    content:
        'Kuala Lumpur is a vibrant city with an incredible nightlife scene. Head over to Bangsar or Changkat Bukit Bintang to experience the city\'s nightlife. These places have an array of bars to choose from.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

//whereToShop 11
  ContentClass(
    id: 'cl1_11',
    decrepitation:
        'In 1888, the Central Market (Pasar Seni) served in Kuala Lumpur formerly as a wet market. As the market started to grow, a permanent structure was designed to accommodate all of the suppliers. By the 1930s the structure on the current façade was further developed.',
    content:
        'The 120-year-old Pasar Seni has been listed as a heritage site by the Department of National Heritage. Inside the building is an array of boutiques, crafts and souvenir stalls with traders selling local goods. It is a short walk away from Petaling Street, along Jalan Hang Kasturi, and is near major transport links to all major destinations in Kuala Lumpur. The complex is an art-deco-style complex with local \'Baroque\' trimmings.',
    workhour: '10.00 am – 10.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-20310399 ',
    locationText:
        'Central Market, Kasturi Walk, 50050, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/cXDKTr1tJ3n7rzKo7',
  ),
  ContentClass(
    id: 'cl2_11',
    decrepitation:
        'Historically known as "Market Square," Petaling Street is the original Chinatown of Kuala Lumpur. Founded around the same time as the city, Petaling street has been active since the mid-19th century. In 2007, the street underwent a multi-million dollar development.',
    content:
        'The Petaling Street Market is well known for its "imitation" products as well as its food options that are rich in culture. With hundreds of vendors selling items ranging from luxury bags to traditional fried rice noodles, Petaling Street is a destination for visitors and locals looking for KL bargains.',
    workhour: '7.00 am – 8.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-26176404',
    locationText:
        'Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/petaling-street-market?share',
  ),
  ContentClass(
    id: 'cl3_11',
    decrepitation:
        'Shoppes by Four Seasons Place Kuala Lumpur is located directly next to KLCC Twin Towers, opposite to Avenue K Shopping Mall and a few minutes walk from LRT KLCC Station.',
    content:
        'Shoppes at Four Seasons Place is an exclusive shopping mall featuring six floors of retail, restaurants, speciality grocer and more. Expect an exciting view of the lively days and nights that KL city centre has to offer!',
    workhour: '10.00 am - 10.00 pm (Daily) ',
    fees: '-',
    phoneNo: '+603-20265085',
    locationText:
        '145, Jalan Ampang, Kuala Lumpur City Centre, 50088 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/tijEBAS2F3UTyEWY7',
  ),
  ContentClass(
    id: 'cl4_11',
    decrepitation:
        'Lot 10 is a shopping complex within the shopping and entertainment district of central Kuala Lumpur, Bintang Walk. It serves the affluent and is the equivalent of high-class shopping in other cities like Fifth Avenue or Knightsbridge in the 1990s.',
    content:
        'A landmark of KL, the location of Lot 10 has been instrumental in its development. Sporting an instantly identifiable, vibrant green façade, substantial refurbishment in early 2012 saw the interior nixing its 1980s theme.',
    workhour: '10.00 am - 10.00 pm ',
    fees: '-',
    phoneNo: '+603-21410500',
    locationText:
        '50, Bukit Bintang Street, Bukit Bintang, 55100 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://g.page/Lot10KL?share',
  ),
  ContentClass(
    id: 'cl5_11',
    decrepitation:
        'Pavilion Kuala Lumpur is a luxurious shopping mall located in the heart of the shopping paradise of Bukit Bintang, Malaysia. ',
    content:
        'Pavilion KL is a favourite among KL-ites, with trendy dining choices, big-box retailers and access to both foreign designer brands and local speciality retailers. Usually crowded no matter the day of the week or afternoon, there are six shopping \'zones\' and a row of street boutiques in the seven-storey lifestyle centre.',
    workhour: '10.00 am - 10.00 pm  ',
    fees: '-',
    phoneNo: '+603-21188833',
    locationText:
        'Bukit Bintang, 55100 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://g.page/pavilionmall-kuala-lumpur?share',
  ),

//nightLife 12
  ContentClass(
    id: 'cl1_12',
    decrepitation:
        'Changkat Bukit Bintang hosts a number of unique nightlife events. Stand-up comedy, foreign movie screenings and open mic evenings are just some of the events',
    content:
        'Hosting lots of themed evenings, talented DJs and live band performances, it\'s fair to say that Changkat Bukit Bintang\'s nightlife is anything but dull. Among the many watering holes available here, there are a few establishments that stand out for their unique concepts. Stand-up comedy, foreign film screenings and open mic nights are just some of the events you\'ll find in this city.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Changkat, Bukit Bintang',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl2_12',
    decrepitation:
        'Attracting a good mix of locals and ex-pats, Bangsar\'s position only four kilometres from KL Sentral Station makes it easily accessible to travellers.',
    content:
        'Still busy no matter the time of the day, the nightfall makes the atmosphere even more electrifying, with bars expected to hop long into the early hours of the morning. Attracting a healthy mix of locals and ex-pats, Bangsar\'s location only four km from KL Sentral Station makes it easily accessible to tourists.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Bangsar',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl3_12',
    decrepitation:
        'Ampang\'s nightlife is a lot more than the first one to meet the eye. Though considered mild compared to other nightlife venues in Kuala Lumpur city centre.',
    content:
        'It goes without saying that the nightlife in Ampang is diverse; rooftop bars are perfect for those who want to sit back and enjoy a glass of wine while enjoying a stunning view of the glittering skyline of KL.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Ampang',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl4_12',
    decrepitation:
        'Petaling Street is packed with clubs, pubs and clubs, but it\'s the after-dark market that makes it special. The area is transformed into a lively and vibrant night market when the sun sets.',
    content:
        'Just a two-minute stroll from the Pasar Seni LRT station, Chinatown Kuala Lumpur nightlife is mostly frequented by budget travellers staying in this part of KL. One of the most popular bars in the area is Reggae Bar Chinatown. ',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: 'Petaling Street',
    locationUrl: '-',
  ),

//whereToEat 13 // Street Food
  ContentClass(
    id: 'cl1_13',
    decrepitation:
        'Located just behind Jalan Bukit Bintang and a short walk away from Changkat Bukit Bintang, Jalan Alor is one of the most popular food streets in Kuala Lumpur. ',
    content:
        'A sharp contrast to trendy Jalan Bukit Bintang and Changkat Bukit Bintang, Jalan Alor\'s street food is available every day, known as KL\'s food haven for most of us. There\'s so much to eat that you\'re not going to be able to finish in just one day.',
    workhour: '24 Hours (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        '21, Jalan Alor, Bukit Bintang, 50200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/PoAbGJVzU5Te6tyK9',
  ),
  ContentClass(
    id: 'cl2_13',
    decrepitation:
        'Taman Connaught Night Market is very popular with the local community for its vast array of Malaysian hawker dishes.',
    content:
        'There are also a number of food stalls selling Korean, Thai, Taiwanese and Japanese snacks at affordable prices. Located along Jalan Cerdas, the Taman Connaught Night Market is accessible by MRT from Kuala Lumpur.',
    workhour: '6.00 pm - 1.00 am (Wed only)',
    fees: '-',
    phoneNo: '-',
    locationText:
        '130, 108, Jalan Cerdas, Taman Connaught, 56000 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/YXLCNQ4q93scAV6t7',
  ),
  ContentClass(
    id: 'cl3_13',
    decrepitation:
        'While Petaling Street is well known one of the shopping paradises in Kuala Lumpur, it is also known for the hawker food.',
    content:
        'It still houses some of the oldest street-food stalls in Malaysia. If you want to enjoy the classic flavours of this country\'s diverse cuisine head there before the peak hours (or after, which ver rocks your boat).',
    workhour: '24 Hours (Daily)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Jalan Petaling, City Centre, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/petaling-street-market?share',
  ),
  ContentClass(
    id: 'cl4_13',
    decrepitation:
        'Located next to KLCC and the Golden Triangle, you\'ll find everything from coconut shakes to soft-shell crab burgers.',
    content:
        'Take the time to visit the 30+ food trucks here. Gather your best buddies and have a meal on the wheels to enjoy some of KL\'s most innovative food company under the stars.',
    workhour: '6.00 pm - 1.00 am (Mon - Thur) \n6.00 pm - 12.00 am (Fri- Sun)',
    fees: '-',
    phoneNo: '-',
    locationText:
        'Persiaran Hampshire, off, Jalan Ampang, Hampshire Park, 50450 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/NApkWHRQkrPgBkLMA',
  ),

//accomation 15 // staying in kl
  ContentClass(
    id: 'cl1_15',
    decrepitation: '-',
    content:
        'Luxurious hotel in downtown Kuala Lumpur. Designed to represent Malaysia\'s true architectural heritage. A beautifully built hotel with a fantastic venue.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-26889688',
    locationText:
        '5, Jalan Conlay, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/rtDQU65UC6bsNpi46',
  ),
  ContentClass(
    id: 'cl2_15',
    decrepitation: '-',
    content:
        'Strategically situated near Kuala Lumpur, Majestic Hotel opened its doors in December 2012. Established in 1932, the original hotel was one of the prominent of Kuala Lumpur in its day.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27858000',
    locationText:
        '5, Jalan Sultan Hishamuddin, Tasik Perdana, 50000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/zvxfPSXEWP6a6PSE7',
  ),
  ContentClass(
    id: 'cl3_15',
    decrepitation: '-',
    content:
        'The Furama Hotel is 750 metres from Imbi Monorail Station and offers spacious accommodation with free WiFi and free on-site parking. Berjaya Times Square shopping centre is only a short 4-minute walk from the hotel.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27888888',
    locationText:
        '136, Jalan Changkat Thambi Dollah, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/furamabukitbintang?share',
  ),
  ContentClass(
    id: 'cl4_15',
    decrepitation: '-',
    content:
        'JW Marriott Kuala Lumpur is located in close proximity to the bustling Bukit Bintang area. This 5-star luxury hotel provides luxurious comfort and convenience.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27159000',
    locationText:
        '183, Bukit Bintang Street, Bukit Bintang, 55100 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/n8fbrfVVfR126DQb6',
  ),
  ContentClass(
    id: 'cl5_15',
    decrepitation: '-',
    content:
        'Mandarin Oriental is located between the famous Petronas Twin Towers and the lush gardens of Kuala Lumpur City Park. The hotel is situated approximately 45 km from KLIA.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-23808888',
    locationText:
        'Kuala Lumpur City Centre, 50088 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://g.page/mandarin-oriental-kuala-lumpur?share',
  ),
  ContentClass(
    id: 'cl6_15',
    decrepitation: '-',
    content:
        'Just 100m from Masjid Jamek LRT station, Citin Hotel is convenient for tourists in the heart of Kuala Lumpur.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-26932999',
    locationText:
        '33, Jalan Melayu, City Centre, 50100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/9nUyxxMFWgcncPKb9',
  ),
  ContentClass(
    id: 'cl7_15',
    decrepitation: '-',
    content:
        'Prescott Hotel Kuala Lumpur is within easy reach of major financial districts, government buildings and entertainment and cultural centres.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27137887',
    locationText:
        'No 23, Lorong Medan Tuanku 1, Off, Jalan Sultan Ismail, 50300 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/e8KnC22y5p1R3k6N7',
  ),
  ContentClass(
    id: 'cl8_15',
    decrepitation: '-',
    content:
        'The Westin Kuala Lumpur is located in the heart of the Golden Triangle of Kuala Lumpur. Shopping malls including Pavilion, Lot 10 and Sungei Wang are located within walking distance of the property.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27318333',
    locationText:
        '199, Bukit Bintang Street, Bukit Bintang, 55100 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/WGBnEt42Bz717M53A',
  ),
  ContentClass(
    id: 'cl9_15',
    decrepitation: '-',
    content:
        'A 2-minute walk to KL Sentral, Hilton Kuala Lumpur is located 750 m away from the 9-storey premium shopping mall, Nu Sentral.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-22642264',
    locationText:
        '3, Jalan Stesen Sentral, Kuala Lumpur Sentral, 50470 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/9Qah1cjEtpi7LRAk8',
  ),
  ContentClass(
    id: 'cl10_15',
    decrepitation: '-',
    content:
        'InterContinental Kuala Lumpur offers facilities in the hustle and bustle of the city centre.',
    workhour: '-',
    fees: '-',
    phoneNo: '+603-27826000',
    locationText:
        '165, Jalan Ampang, Kuala Lumpur, 50450 Kuala Lumpur, Federal Territory of Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/chLuAmGSRMYrMSyYA',
  ),

  //dance 16
  ContentClass(
    id: 'cl1_16',
    decrepitation:
        'Joget is one of the traditional dances of Malaysia (interchangeably a type of music) which is widely performed in cultural events and weddings. ',
    content:
        'It is derived from two popular Portuguese folk dances - Branyo and Farapeira. With European roots, this dance form originated in Malacca during the 16th century. Also known as Chakunchak, Joget can be performed without singing too. This Malay dance style is typically performed by couples who seem to playfully tease each other. The charm of the dance lies in the fact that the couple doesn\'t touch one another as they make rhythmic gestures of their hands and feet.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl2_16',
    decrepitation:
        'Zapin is a popular Malay dance in the states of Johor, Pahang and Selangor, Malaysia. This dance of Malaysia was introduced by Middle Eastern Arab merchants in the 14th century.',
    content:
        'This dance style is a delightful combination of Islamic teachings with graceful body movements. That\'s why Zapin was performed previously only by men. It was performed later in pairs with the ladies. Zapin can be done with great variation depending on the various styles and steps of the dance. Zapin is performed to the tunes of Rebana (drum), Dok, Marwas (bongos), Rebab, Gambus and accordion.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl3_16',
    decrepitation:
        'Dikir Barat is a fine mix of Malay music, dance and poetry. It is typically carried out during the harvest season and on family events. Dikir Barat is a way for educating viewers, addressing key issues and passing social statements in a comic or satirical tone. ',
    content:
        'This dance style is said to have emerged from Malay villages in southern Thailand. In the native language, Barat means "Western" and Dikir is related to Zikir, which means "religious singing and singing." Dikir Barat is very popular in Kelantan. In May 1998, the Government of Kelantan prohibited this form of dance. It was a short time, though, and the ban was lifted in no time.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl4_16',
    decrepitation:
        'Bharathanatyam is a major form of Indian classical dance which is native to Tamil Nadu. It is the oldest classical dance tradition of India which evidence can be traced back to 2nd century CE.',
    content:
        'Like all Indian classical dances, Bharatanatyam is steeped in symbolism, both in its abhinaya (acting) and intends. Gestures and facial expressions convey the ras (feeling, emotional taste) and bhava (mood) of the underlying plot. The dance is usually accompanied by music and a singer.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl5_16',
    decrepitation:
        'Odissi is an ancient classical dance which originated in the Hindu temples of Odisha, the eastern coastal state of India. Odissi was dominated by women, expressing fables and spiritual ideas, especially Vaishnavism (Vishnu). ',
    content:
        'Conventional Odissi exists in two major styles, the first mastered by women and focused on solemn, spiritual temple dance (maharis) The second perfected by boys dressed as girls (gotipuas) expanded to include athletic and acrobatic movements.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl6_16',
    decrepitation:
        'The emergence of Kathak is traditionally linked to the travel bards of ancient northern India known as Kathakars or storytellers. The term Kathak is derived from the Vedic Sanskrit word Katha, which means "story" and Kathakar, which means "the one who tells stories" or "to do with stories."',
    content:
        'Kathak has continued to thrive as an oral tradition, innovated and taught, and verbally and through practice, from one generation to the next. It was changed, adapted and integrated the tastes of the Mughal courts in the 16th and 17th centuries, particularly Akbar. It was ridiculed and declined in the British colonial era, then reborn as India attained independence and sought to reclaim its ancient roots and a sense of national identity through the arts.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl7_16',
    decrepitation:
        'The lion dance migrated to Malaysia more than a century ago with Chinese emigrants, but since then it has evolved over time to have its own distinct identity. An intoxicating spectacle of sights and sounds that will make your heart pound.',
    content:
        'The lion dance is most often performed in Malaysia during the Lunar New Year, but it also takes place at important events such as the launching of new business to welcome important guests, at auspicious celebrations and competitions. Draped in an elaborate costume, two dancers play the lion – one as the head, the other as the tail. Complemented by cymbals and drums, the dancers dance to the beat as they imitate the lion\'s movements as they wake up, eat and play while performing different stories on different occasions.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl8_16',
    decrepitation:
        'Sumazau is a popular dance in Sabah and Malaysia. It is a traditional dance of the two unified social groups called "Kadazan Dusun." Sumazau is commonly performed at the harvest festival in May. This dance is commonly performed by farmers, where both males and females are styled in traditional black and red clothes.',
    content:
        'The flying patterns of the eagles observed by the farmers during harvesting is what inspired Sumazau. While dancing, it is made sure that the dancers are lined up a few centimetres away from one another to avoid touching the other performer.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl9_16',
    decrepitation:
        'The origin of this indigenous dance is not well known, but it is believed to have been part of the Iban tribe since the 16th century. The Ngajat dance is presumed to have been performed by warriors upon their return from battle. ',
    content:
        'In modern times, it is performed to celebrate the most significant harvest festival called \'Gawai,\' to welcome important guests to the longhouses, and so on. The male dancers wear large feathers as part of their headgear, holding an ornate and long shield in their hands with chains, beads and a loincloth called \'cawat.\' The female dancers have a sophisticated headdress, chains, beads and a \'dress\' that reaches to the bottom of their knees with intricate weaving. Traditionally, this dance was performed only by male dancers but no longer by male dancers.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
  ContentClass(
    id: 'cl10_16',
    decrepitation:
        'The term bhangra refers to a particular dance performed by Sikh men in the Punjab agricultural districts. The dance was primarily associated with the Baisakhi Spring Harvest Festival, and it was from one of the main products of the harvest — bhang (hemp)—that Bhangra took its name. ',
    content:
        'In a traditional performance, several dancers will perform vigorous kicks, leaps and bends of the body to accompany short songs called boliyan and, most significantly, to beat the dhol (double-headed drum). Struck with a heavy beater on one end and a lighter stick on the other, the dhol imbued the music with a syncopated (slow beat accents), a swinging rhythmic character that has generally remained the hallmark of any music that has come to bear the name of the bhangra.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  //music 18
  ContentClass(
    id: 'cl1_18',
    decrepitation: '-',
    content:
        'The most traditional Malay instrument, the kompang is widely used in Malay social occasions such as National Day parades, official functions, and weddings. It is similar to the tambourine but without the jingling metal discs.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl2_18',
    decrepitation: '-',
    content:
        'In the days of the ancient Malay kingdoms, the thunderous rhythmic beats of the giant rebana ubi drums transmitted different messages from danger alerts to wedding announcements. Today, it is used as an instrument in a number of social performances.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl3_18',
    decrepitation: '-',
    content:
        'Brought to Malaysia by Persian and Middle Eastern merchants, Gambus or Oud (Arabian) is played in a variety of genres in Malay folk music, mainly as a leading instrument in Ghazal music. Carefully made with combinations of various woods, this instrument creates a soft tone close to that of a harpsichord.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl4_18',
    decrepitation: '-',
    content:
        'The gamelan looks similar to the xylophone, originating from the Majapahit period in the 10th century AD, this ensemble of brass percussion is performed like an orchestra.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl5_18',
    decrepitation: '-',
    content:
        'Serunai is a wind instrument made of wood and consists of seven holes at the top and one hole at the bottom. It is often used in traditional performances such as \'Wayang Kulit\' (Shadow Play), Menora (Kelantan) or \'Silat\' (Martial Arts).',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl6_18',
    decrepitation: '-',
    content:
        'The Guqin is a seven-stringed zither without bridges, most classical Chinese instrument with more than 3000 years of history. It has been played since ancient times and has historically been preferred by scholars and literati as an instrument of great subtlety and sophistication.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl7_18',
    decrepitation: '-',
    content:
        'The erhu is the most popular of the huqin family of traditional bowed string instruments used by various ethnic groups of China. It is used as a solo instrument as well as in small ensembles and large orchestras. As a very versatile instrument, it is used in both traditional and contemporary music arrangements.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl8_18',
    decrepitation: '-',
    content:
        'Tanggu is simply a ceremonial hall drum, also written Tang Gu, a traditional Chinese drum from the 19th century. It is medium in size and barrel-shaped, with two heads made of animal hide, and it is played with two sticks.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl9_18',
    decrepitation: '-',
    content:
        'Although ethnic groups in Southwest China were the earliest to use this metal percussion instrument with wooden sticks, subsequent cultural exchanges spread this instrument to other regions by the 2nd century BC.  After that, different kinds of gongs were used for both musical occasions and general festivities, such as weddings. Since gongs may take different shapes, their sizes often vary.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl10_18',
    decrepitation: '-',
    content:
        'The bangu, often simply gu, is a Chinese frame drum used in Chinese opera. When struck by one or two bamboo sticks, it creates a sharp dry sound. It is also used in many Chinese chamber music ensembles. The percussion section is very important in Chinese Opera, with battle or \'martial\' scenes.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl11_18',
    decrepitation: '-',
    content:
        'The sitar is a plucked stringed instrument, originated from India, it is used in classical Hindu music. The instrument was conceived in ancient India and evolved in the 16th and 17th centuries, reaching its present form in India in the 18th century.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl12_18',
    decrepitation: '-',
    content:
        'The veena is part of chordophone instruments from India. It\'s got 24 frets, four melody strings, and three drone strings, and it\'s played the same way. It remains an important and common string instrument for classical Carnatic music.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl13_18',
    decrepitation: '-',
    content:
        'Tabla is a pair of twin hand drums. Since the 18th century, tabla has been principal percussion instrument in Hindustani classical music. Tabla is also frequently played in popular and folk music performances in India, Bangladesh, Pakistan.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl14_18',
    decrepitation: '-',
    content:
        'The mridangam is an instrument of percussion of ancient origin. It is the primary rhythmic accompaniment to the Carnatic music ensemble. It is a double-sided drum whose body is usually made of a hollow piece of jackfruit wood about an inch thick.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl15_18',
    decrepitation: '-',
    content:
        'The Ghatam is one of the most ancient percussion instruments of India. It\'s a clay pot with a small mouth. It slants out from the mouth to form a ridge. Made mostly of clay backed with brass or copper filings with a small amount of iron filings, the ghatam pitch varies depending on its size. The pitch may be slightly changed by the application of clay or water.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

//games 19
  ContentClass(
    id: 'cl1_19',
    decrepitation:
        'Congkak or Congklak is a game of Malay origin played in Malaysia, Singapore, Brunei, Southern Thailand, and parts of Sumatra and Borneo. ',
    content:
        'The Congkak board has 14 holes in two sets of seven. Each player controls seven holes on their side of the board. Their score is the number of seeds in their left-hand store. The word congkak is believed to be derived from the Malay word “congak”, meaning "mental calculation" which is mainly practised in this game. It is considered that an efficient player who mentally analyses a few steps in advance will have an advantage in accumulating points to win the game. The word congkak also means cowrie shells that are used in the game.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl2_19',
    decrepitation:
        'Batu Seremban (west coast of the Peninsular) or Serembat (north and east coast of the Peninsular) is a traditional game played in Malaysia. Girls are usually played individually or in groups of two to five people.',
    content:
        'Batu seremban is similar to the game of jacks, where the object is thrown into the air, the objects are collected on the ground, and the tossed item is caught. Unlike jacks, there\'s no ball, and traditional players use 5 stones they\'ve collected. Today, in Malaysia, small sacks of cloth containing seeds or beans are often used instead of stones.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl3_19',
    decrepitation:
        'Top spinning was a popular game played in the Kampungs (\'villages\' in Malay) of Singapore and Malaysia, especially among members of the Malay community.',
    content:
        'This is a traditional game that tests a player\'s ability to spin the top so that he can spin for a long time without stopping. Played by boys from 9 years and above to male adults, the game involves 2 or more players.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),

  ContentClass(
    id: 'cl4_19',
    decrepitation:
        'This is a game that tests a player\'s skill and efficiency in kite flying. Usually played by adult males, there is no fixed number of players. As a matter of fact, the more players the merrier. Played in open areas, this game requires a kite and a long string or yarn.',
    content:
        'The game can also be played as a competition to choose the highest-flying kite, the most skilful kite player, the most colourful kite, the kite with the most beautiful drawing, and the kite that flies straightest.',
    workhour: '-',
    fees: '-',
    phoneNo: '-',
    locationText: '-',
    locationUrl: '-',
  ),
];

const MedicalData = const [
  MedicalClass(
    id: 'cl1_14',
    categories: 'cl1_14',
    title: 'Gleneagles, Kuala Lumpur',
    decrepitation:
        'Gleneagles Kuala Lumpur has become the country\'s preferred private health-care facility, much favoured by both locals and foreigners.',
    content:
        'The hospital\'s international credibility has steadily grown over the last 20 years to establish itself as one of the country\'s most favoured private healthcare facilities for both local and international patients.',
    workhour: 'Open 24 hours (Daily)',
    fees: '-',
    phoneNo: '+603-41413000',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Gleneagles-KL.jpg',
    locationText:
        'Block A & Block B, 286 & 288, J alan Ampang, Kampung Berembang, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/QcV4gaEFdhhsMuhQA',
  ),
  MedicalClass(
    id: 'cl2_14',
    categories: 'cl1_14',
    title: 'KPJ Tawakkal Specialist Hospital',
    decrepitation:
        'Established in 1894, KPJ Tawakkal Specialist Hospital is now part of the chain of largest hospitals under the flagship of KPJ Healthcare Bhd.',
    content:
        'The hospital is situated in close vicinity to the National Heart Institute, National Blood Bank, the Institute of Medical Science and the National Library. \nInternational: +603 2726 8688',
    workhour: 'Open 24 hours (Daily)',
    fees: '-',
    phoneNo: '1800-18-8688',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/KPJ-Tawakkal-KL.jpg',
    locationText:
        '1, Jalan Pahang Barat, Pekeliling, 53000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/PzR7S8BC1A5eAXha8',
  ),
  MedicalClass(
    id: 'cl3_14',
    categories: 'cl1_14',
    title: 'Damai Service Hospital',
    decrepitation:
        'The Damai Service Hospital (HQ) was established in 1981 and is a leading group of Malaysian hospitals offering secondary healthcare.',
    content:
        'The facility has a wide range of diagnostic and rehabilitation services capable of treating up to 95% of the illness spectrum.',
    workhour: 'Open 24 hours (Daily)',
    fees: '-',
    phoneNo: '+603-40434900',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Damai-Service-Hospital.jpg',
    locationText:
        '1, Jalan Pahang Barat, Pekeliling, 53000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/Umg3NfnEZZxssPys7',
  ),
  MedicalClass(
    id: 'cl1_14',
    categories: 'cl2_14',
    title: 'DentalPro (Kuala Lumpur, Malaysia)',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Dental-Pro.jpg',
    decrepitation:
        'DentalPro is a specialised dental centre situated in the capital of Malaysia, Kuala Lumpur. They were founded in 2003 and have treated patients from all over the world. ',
    content:
        'DentalPro specialises in restorative and cosmetic dentistry procedures such as implants, crowns, bridges, composite and porcelain veneers and root canal treatment. They also have general dental treatment.',
    workhour: '9.00 am - 6.00 pm (Mon-Sat) \nClosed on Sun & Public Holiday',
    fees: '-',
    phoneNo: '+603-21471111',
    locationText:
        '12, Jalan Sri Semantan 1, Damansara Heights, 50490 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/dentalpro-specialist?share',
  ),
  MedicalClass(
    id: 'cl2_14',
    categories: 'cl2_14',
    title: 'Imperial Dental Specialist Centre',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Imperial-Dental-Specialist-Centre.jpg',
    decrepitation:
        'Imperial Dental Specialist Centre specialises in Orthodontic, Implant Surgery and Surgical Removal of Wisdom Tooth in Malaysia as well as the world.',
    content:
        'They operate as a one-stop dental centre offering holistic solutions to dental, skeletal and soft tissue problems as well as neuromuscular problems of the craniofacial areas in complete dental treatment combined with the body\'s overall physical health.',
    workhour: '9.00 am - 8.00 pm (Mon-Sat) \n9.00 am - 6.00 pm (Sun)',
    fees: '-',
    phoneNo: '+603-92120605',
    locationText:
        '62 & 64, Jalan Telawi, Bangsar, 59100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://g.page/imperialdentalspecialistcentre?share',
  ),
  MedicalClass(
    id: 'cl3_14',
    categories: 'cl2_14',
    title: 'Kuala Lumpur International Dental Centre (Ampang)',
    image: 'assets/images/contentList/medicalTourism/sub-medical/KLIDC.jpg',
    decrepitation:
        'Kuala Lumpur International Dental Centre has positioned itself as the provider of quality oral healthcare, a front runner in the dental healthcare tourism industry.',
    content:
        'KLIDC is equipped to manage and treat oral cavity diseases as well as oral surgery and advanced implant and bone augmentation surgery. ',
    workhour: '10.00 am - 7.00 pm (Daily)',
    fees: '-',
    phoneNo: '+603-21625555',
    locationText: 'G-01 M SUITES, 283, Jalan Ampang, 50450 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/CPhmyuAfvA86YGeH9',
  ),
  MedicalClass(
    id: 'cl1_14',
    categories: 'cl3_14',
    title: 'Dr Ko Clinic',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Klinik-Dr-KO.jpg',
    decrepitation:
        'KO Skin Specialist was amongst Malaysia\'s pioneering skin and aesthetic clinic founded by Dr Ko Chung Beng.',
    content:
        'Using the latest state-of-the-art technology, their mission is to help you uncover your beauty potential and reclaim your confidence. Ko Skin Specialists work to distinguish themselves from other skincare clinics in the region by always showing sincere consideration to each and every patient they treat.',
    workhour: '10.00 am - 7.00 pm (Mon- Fri) \n10.00 am - 6.00 pm (Sat) ',
    fees: '-',
    phoneNo: '+603-92210261',
    locationText:
        '32-4, Jalan Metro Pudu, Fraser Business Park, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/TC2Pp6QsgV8jypQg8',
  ),
  MedicalClass(
    id: 'cl2_14',
    categories: 'cl3_14',
    title: 'Nexus Clinic Kuala Lumpur (Skin & Hair Aesthetic Clinic)',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Nexus-Clinic-KL.jpg',
    decrepitation:
        'Nexus Wellness offers Skin Lesion Removal procedures to patients from a total of 28 procedures available, across 7 different specialities.',
    content:
        'Using the latest state-of-the-art technology, their mission is to help you uncover your beauty potential and reclaim your confidence. Ko Skin Specialists work to distinguish themselves from other skincare clinics in the region by always showing sincere consideration to each and every patient they treat.',
    workhour: '8.30 am - 6.00 pm (Mon -Thur) \n8.30 am - 6.30 pm (Fri & Sat)  ',
    fees: '-',
    phoneNo: '+6016-7025699 ',
    locationText:
        'LG 10, Lower Ground Floor, Wisma UOA II, Jalan Pinang, 50450 Kuala Lumpur',
    locationUrl: 'https://goo.gl/maps/5YAaJVpS2jYeu4jy7',
  ),
  MedicalClass(
    id: 'cl3_14',
    categories: 'cl3_14',
    title: 'Peter Ch’ng Clinic',
    image:
        'assets/images/contentList/medicalTourism/sub-medical/Peter-Chng.jpg',
    decrepitation:
        'Peter Ching Clinic offers treatment procedures for acne patients among its total of 7 available procedures, covering 3 different specialities.',
    content:
        'Peter Ch’ng Clinic offers services that treat patients\' skin disorders. The range of services includes a number of skin problems and issues, hair (removal and growth) and body problems.',
    workhour: '10.00 am - 6.00 pm (Mon - Sat)',
    fees: '-',
    phoneNo: '+6011-22882299',
    locationText:
        'G-G-1 Plaza Arkadia, 3 Jalan Intisari Perdana, Desa Parkcity, 52200 Kuala Lumpur',
    locationUrl: 'https://g.page/peterchngdpc?share',
  ),
];
