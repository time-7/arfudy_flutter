import 'package:faker/faker.dart';

String get proxyImgUrl => 'https://loremflickr.com/${faker.randomGenerator.integer(500, min: 300)}/500/food';
int get proxyInt => faker.randomGenerator.integer(9999);
List<int> get proxyInts => faker.randomGenerator.numbers(200, 12);
double get proxyDouble => faker.randomGenerator.decimal();
String get proxyWord => faker.lorem.word();
String proxyWords([int words = 12]) => faker.lorem.words(words).join(' ');
String get proxyName => faker.person.name();
bool get proxyBool => faker.randomGenerator.boolean();

String proxyRandomAmountWords([int maximumAmountWords = 8]) {
  int words = faker.randomGenerator.integer(maximumAmountWords, min: 1);
  return faker.lorem.words(words).join(' ');
}
