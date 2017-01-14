use Test::More qw(no_plan);
use Date::Range;
use Data::Dumper;
use CodeRyte::DateRange;

my $ref_date = '2016-12-28';

my $crdr = CodeRyte::DateRange->new(today_override => $ref_date);
my $dr = Date::Range->new(today_date => $ref_date, type => 'WEEk');

while (my $line = <main::DATA>) {
    chomp $line;
    my ($start_dow,$intervals,$span,$sliding_window,$direction,$test_start,$test_end,$test_last) = split /,/, $line;
    $dr->set_start_dow($start_dow);
    $dr->set_intervals($intervals);
    $dr->set_span($span);
    $dr->set_sliding_window($sliding_window);
    $dr->set_direction($direction);
    my $atts = "I=$intervals | S=$span | W=$sliding_window | D=$direction";

    my ($start,$end,$last) = $dr->get_dates;
    cmp_ok($start,'eq',$test_start,"$type START $atts") or BAIL_OUT("Fail");
    cmp_ok($end,'eq',$test_end,"$type END $atts") or BAIL_OUT("Fail");
    cmp_ok($last,'eq',$test_last,"$type LAST $atts") or BAIL_OUT("Fail");

}

__END__
MONDAY,-3,1,0,-,2017-01-16,2017-01-23,2017-01-22
MONDAY,-2,1,0,-,2017-01-09,2017-01-16,2017-01-15
MONDAY,-1,1,0,-,2017-01-02,2017-01-09,2017-01-08
MONDAY,0,1,0,-,2016-12-26,2017-01-02,2017-01-01
MONDAY,1,1,0,-,2016-12-19,2016-12-26,2016-12-25
MONDAY,2,1,0,-,2016-12-12,2016-12-19,2016-12-18
MONDAY,3,1,0,-,2016-12-05,2016-12-12,2016-12-11
MONDAY,-3,5,0,-,2017-04-10,2017-05-15,2017-05-14
MONDAY,-2,5,0,-,2017-03-06,2017-04-10,2017-04-09
MONDAY,-1,5,0,-,2017-01-30,2017-03-06,2017-03-05
MONDAY,0,5,0,-,2016-12-26,2017-01-30,2017-01-29
MONDAY,1,5,0,-,2016-11-21,2016-12-26,2016-12-25
MONDAY,2,5,0,-,2016-10-17,2016-11-21,2016-11-20
MONDAY,3,5,0,-,2016-09-12,2016-10-17,2016-10-16
MONDAY,-3,5,1,-,2016-12-19,2017-01-23,2017-01-22
MONDAY,-2,5,1,-,2016-12-12,2017-01-16,2017-01-15
MONDAY,-1,5,1,-,2016-12-05,2017-01-09,2017-01-08
MONDAY,0,5,1,-,2016-11-28,2017-01-02,2017-01-01
MONDAY,1,5,1,-,2016-11-21,2016-12-26,2016-12-25
MONDAY,2,5,1,-,2016-11-14,2016-12-19,2016-12-18
MONDAY,3,5,1,-,2016-11-07,2016-12-12,2016-12-11
TUESDAY,-3,1,0,-,2017-01-17,2017-01-24,2017-01-23
TUESDAY,-2,1,0,-,2017-01-10,2017-01-17,2017-01-16
TUESDAY,-1,1,0,-,2017-01-03,2017-01-10,2017-01-09
TUESDAY,0,1,0,-,2016-12-27,2017-01-03,2017-01-02
TUESDAY,1,1,0,-,2016-12-20,2016-12-27,2016-12-26
TUESDAY,2,1,0,-,2016-12-13,2016-12-20,2016-12-19
TUESDAY,3,1,0,-,2016-12-06,2016-12-13,2016-12-12
TUESDAY,-3,5,0,-,2017-04-11,2017-05-16,2017-05-15
TUESDAY,-2,5,0,-,2017-03-07,2017-04-11,2017-04-10
TUESDAY,-1,5,0,-,2017-01-31,2017-03-07,2017-03-06
TUESDAY,0,5,0,-,2016-12-27,2017-01-31,2017-01-30
TUESDAY,1,5,0,-,2016-11-22,2016-12-27,2016-12-26
TUESDAY,2,5,0,-,2016-10-18,2016-11-22,2016-11-21
TUESDAY,3,5,0,-,2016-09-13,2016-10-18,2016-10-17
TUESDAY,-3,5,1,-,2016-12-20,2017-01-24,2017-01-23
TUESDAY,-2,5,1,-,2016-12-13,2017-01-17,2017-01-16
TUESDAY,-1,5,1,-,2016-12-06,2017-01-10,2017-01-09
TUESDAY,0,5,1,-,2016-11-29,2017-01-03,2017-01-02
TUESDAY,1,5,1,-,2016-11-22,2016-12-27,2016-12-26
TUESDAY,2,5,1,-,2016-11-15,2016-12-20,2016-12-19
TUESDAY,3,5,1,-,2016-11-08,2016-12-13,2016-12-12
WEDNESDAY,-3,1,0,-,2017-01-18,2017-01-25,2017-01-24
WEDNESDAY,-2,1,0,-,2017-01-11,2017-01-18,2017-01-17
WEDNESDAY,-1,1,0,-,2017-01-04,2017-01-11,2017-01-10
WEDNESDAY,0,1,0,-,2016-12-28,2017-01-04,2017-01-03
WEDNESDAY,1,1,0,-,2016-12-21,2016-12-28,2016-12-27
WEDNESDAY,2,1,0,-,2016-12-14,2016-12-21,2016-12-20
WEDNESDAY,3,1,0,-,2016-12-07,2016-12-14,2016-12-13
WEDNESDAY,-3,5,0,-,2017-04-12,2017-05-17,2017-05-16
WEDNESDAY,-2,5,0,-,2017-03-08,2017-04-12,2017-04-11
WEDNESDAY,-1,5,0,-,2017-02-01,2017-03-08,2017-03-07
WEDNESDAY,0,5,0,-,2016-12-28,2017-02-01,2017-01-31
WEDNESDAY,1,5,0,-,2016-11-23,2016-12-28,2016-12-27
WEDNESDAY,2,5,0,-,2016-10-19,2016-11-23,2016-11-22
WEDNESDAY,3,5,0,-,2016-09-14,2016-10-19,2016-10-18
WEDNESDAY,-3,5,1,-,2016-12-21,2017-01-25,2017-01-24
WEDNESDAY,-2,5,1,-,2016-12-14,2017-01-18,2017-01-17
WEDNESDAY,-1,5,1,-,2016-12-07,2017-01-11,2017-01-10
WEDNESDAY,0,5,1,-,2016-11-30,2017-01-04,2017-01-03
WEDNESDAY,1,5,1,-,2016-11-23,2016-12-28,2016-12-27
WEDNESDAY,2,5,1,-,2016-11-16,2016-12-21,2016-12-20
WEDNESDAY,3,5,1,-,2016-11-09,2016-12-14,2016-12-13
THURSDAY,-3,1,0,-,2017-01-12,2017-01-19,2017-01-18
THURSDAY,-2,1,0,-,2017-01-05,2017-01-12,2017-01-11
THURSDAY,-1,1,0,-,2016-12-29,2017-01-05,2017-01-04
THURSDAY,0,1,0,-,2016-12-22,2016-12-29,2016-12-28
THURSDAY,1,1,0,-,2016-12-15,2016-12-22,2016-12-21
THURSDAY,2,1,0,-,2016-12-08,2016-12-15,2016-12-14
THURSDAY,3,1,0,-,2016-12-01,2016-12-08,2016-12-07
THURSDAY,-3,5,0,-,2017-04-06,2017-05-11,2017-05-10
THURSDAY,-2,5,0,-,2017-03-02,2017-04-06,2017-04-05
THURSDAY,-1,5,0,-,2017-01-26,2017-03-02,2017-03-01
THURSDAY,0,5,0,-,2016-12-22,2017-01-26,2017-01-25
THURSDAY,1,5,0,-,2016-11-17,2016-12-22,2016-12-21
THURSDAY,2,5,0,-,2016-10-13,2016-11-17,2016-11-16
THURSDAY,3,5,0,-,2016-09-08,2016-10-13,2016-10-12
THURSDAY,-3,5,1,-,2016-12-15,2017-01-19,2017-01-18
THURSDAY,-2,5,1,-,2016-12-08,2017-01-12,2017-01-11
THURSDAY,-1,5,1,-,2016-12-01,2017-01-05,2017-01-04
THURSDAY,0,5,1,-,2016-11-24,2016-12-29,2016-12-28
THURSDAY,1,5,1,-,2016-11-17,2016-12-22,2016-12-21
THURSDAY,2,5,1,-,2016-11-10,2016-12-15,2016-12-14
THURSDAY,3,5,1,-,2016-11-03,2016-12-08,2016-12-07
FRIDAY,-3,1,0,-,2017-01-13,2017-01-20,2017-01-19
FRIDAY,-2,1,0,-,2017-01-06,2017-01-13,2017-01-12
FRIDAY,-1,1,0,-,2016-12-30,2017-01-06,2017-01-05
FRIDAY,0,1,0,-,2016-12-23,2016-12-30,2016-12-29
FRIDAY,1,1,0,-,2016-12-16,2016-12-23,2016-12-22
FRIDAY,2,1,0,-,2016-12-09,2016-12-16,2016-12-15
FRIDAY,3,1,0,-,2016-12-02,2016-12-09,2016-12-08
FRIDAY,-3,5,0,-,2017-04-07,2017-05-12,2017-05-11
FRIDAY,-2,5,0,-,2017-03-03,2017-04-07,2017-04-06
FRIDAY,-1,5,0,-,2017-01-27,2017-03-03,2017-03-02
FRIDAY,0,5,0,-,2016-12-23,2017-01-27,2017-01-26
FRIDAY,1,5,0,-,2016-11-18,2016-12-23,2016-12-22
FRIDAY,2,5,0,-,2016-10-14,2016-11-18,2016-11-17
FRIDAY,3,5,0,-,2016-09-09,2016-10-14,2016-10-13
FRIDAY,-3,5,1,-,2016-12-16,2017-01-20,2017-01-19
FRIDAY,-2,5,1,-,2016-12-09,2017-01-13,2017-01-12
FRIDAY,-1,5,1,-,2016-12-02,2017-01-06,2017-01-05
FRIDAY,0,5,1,-,2016-11-25,2016-12-30,2016-12-29
FRIDAY,1,5,1,-,2016-11-18,2016-12-23,2016-12-22
FRIDAY,2,5,1,-,2016-11-11,2016-12-16,2016-12-15
FRIDAY,3,5,1,-,2016-11-04,2016-12-09,2016-12-08
SATURDAY,-3,1,0,-,2017-01-14,2017-01-21,2017-01-20
SATURDAY,-2,1,0,-,2017-01-07,2017-01-14,2017-01-13
SATURDAY,-1,1,0,-,2016-12-31,2017-01-07,2017-01-06
SATURDAY,0,1,0,-,2016-12-24,2016-12-31,2016-12-30
SATURDAY,1,1,0,-,2016-12-17,2016-12-24,2016-12-23
SATURDAY,2,1,0,-,2016-12-10,2016-12-17,2016-12-16
SATURDAY,3,1,0,-,2016-12-03,2016-12-10,2016-12-09
SATURDAY,-3,5,0,-,2017-04-08,2017-05-13,2017-05-12
SATURDAY,-2,5,0,-,2017-03-04,2017-04-08,2017-04-07
SATURDAY,-1,5,0,-,2017-01-28,2017-03-04,2017-03-03
SATURDAY,0,5,0,-,2016-12-24,2017-01-28,2017-01-27
SATURDAY,1,5,0,-,2016-11-19,2016-12-24,2016-12-23
SATURDAY,2,5,0,-,2016-10-15,2016-11-19,2016-11-18
SATURDAY,3,5,0,-,2016-09-10,2016-10-15,2016-10-14
SATURDAY,-3,5,1,-,2016-12-17,2017-01-21,2017-01-20
SATURDAY,-2,5,1,-,2016-12-10,2017-01-14,2017-01-13
SATURDAY,-1,5,1,-,2016-12-03,2017-01-07,2017-01-06
SATURDAY,0,5,1,-,2016-11-26,2016-12-31,2016-12-30
SATURDAY,1,5,1,-,2016-11-19,2016-12-24,2016-12-23
SATURDAY,2,5,1,-,2016-11-12,2016-12-17,2016-12-16
SATURDAY,3,5,1,-,2016-11-05,2016-12-10,2016-12-09
SUNDAY,-3,1,0,-,2017-01-15,2017-01-22,2017-01-21
SUNDAY,-2,1,0,-,2017-01-08,2017-01-15,2017-01-14
SUNDAY,-1,1,0,-,2017-01-01,2017-01-08,2017-01-07
SUNDAY,0,1,0,-,2016-12-25,2017-01-01,2016-12-31
SUNDAY,1,1,0,-,2016-12-18,2016-12-25,2016-12-24
SUNDAY,2,1,0,-,2016-12-11,2016-12-18,2016-12-17
SUNDAY,3,1,0,-,2016-12-04,2016-12-11,2016-12-10
SUNDAY,-3,5,0,-,2017-04-09,2017-05-14,2017-05-13
SUNDAY,-2,5,0,-,2017-03-05,2017-04-09,2017-04-08
SUNDAY,-1,5,0,-,2017-01-29,2017-03-05,2017-03-04
SUNDAY,0,5,0,-,2016-12-25,2017-01-29,2017-01-28
SUNDAY,1,5,0,-,2016-11-20,2016-12-25,2016-12-24
SUNDAY,2,5,0,-,2016-10-16,2016-11-20,2016-11-19
SUNDAY,3,5,0,-,2016-09-11,2016-10-16,2016-10-15
SUNDAY,-3,5,1,-,2016-12-18,2017-01-22,2017-01-21
SUNDAY,-2,5,1,-,2016-12-11,2017-01-15,2017-01-14
SUNDAY,-1,5,1,-,2016-12-04,2017-01-08,2017-01-07
SUNDAY,0,5,1,-,2016-11-27,2017-01-01,2016-12-31
SUNDAY,1,5,1,-,2016-11-20,2016-12-25,2016-12-24
SUNDAY,2,5,1,-,2016-11-13,2016-12-18,2016-12-17
SUNDAY,3,5,1,-,2016-11-06,2016-12-11,2016-12-10
MONDAY,-3,1,0,+,2016-12-05,2016-12-12,2016-12-11
MONDAY,-2,1,0,+,2016-12-12,2016-12-19,2016-12-18
MONDAY,-1,1,0,+,2016-12-19,2016-12-26,2016-12-25
MONDAY,0,1,0,+,2016-12-26,2017-01-02,2017-01-01
MONDAY,1,1,0,+,2017-01-02,2017-01-09,2017-01-08
MONDAY,2,1,0,+,2017-01-09,2017-01-16,2017-01-15
MONDAY,3,1,0,+,2017-01-16,2017-01-23,2017-01-22
MONDAY,-3,5,0,+,2016-09-12,2016-10-17,2016-10-16
MONDAY,-2,5,0,+,2016-10-17,2016-11-21,2016-11-20
MONDAY,-1,5,0,+,2016-11-21,2016-12-26,2016-12-25
MONDAY,0,5,0,+,2016-12-26,2017-01-30,2017-01-29
MONDAY,1,5,0,+,2017-01-30,2017-03-06,2017-03-05
MONDAY,2,5,0,+,2017-03-06,2017-04-10,2017-04-09
MONDAY,3,5,0,+,2017-04-10,2017-05-15,2017-05-14
MONDAY,-3,5,1,+,2016-12-05,2017-01-09,2017-01-08
MONDAY,-2,5,1,+,2016-12-12,2017-01-16,2017-01-15
MONDAY,-1,5,1,+,2016-12-19,2017-01-23,2017-01-22
MONDAY,0,5,1,+,2016-12-26,2017-01-30,2017-01-29
MONDAY,1,5,1,+,2017-01-02,2017-02-06,2017-02-05
MONDAY,2,5,1,+,2017-01-09,2017-02-13,2017-02-12
MONDAY,3,5,1,+,2017-01-16,2017-02-20,2017-02-19
TUESDAY,-3,1,0,+,2016-12-06,2016-12-13,2016-12-12
TUESDAY,-2,1,0,+,2016-12-13,2016-12-20,2016-12-19
TUESDAY,-1,1,0,+,2016-12-20,2016-12-27,2016-12-26
TUESDAY,0,1,0,+,2016-12-27,2017-01-03,2017-01-02
TUESDAY,1,1,0,+,2017-01-03,2017-01-10,2017-01-09
TUESDAY,2,1,0,+,2017-01-10,2017-01-17,2017-01-16
TUESDAY,3,1,0,+,2017-01-17,2017-01-24,2017-01-23
TUESDAY,-3,5,0,+,2016-09-13,2016-10-18,2016-10-17
TUESDAY,-2,5,0,+,2016-10-18,2016-11-22,2016-11-21
TUESDAY,-1,5,0,+,2016-11-22,2016-12-27,2016-12-26
TUESDAY,0,5,0,+,2016-12-27,2017-01-31,2017-01-30
TUESDAY,1,5,0,+,2017-01-31,2017-03-07,2017-03-06
TUESDAY,2,5,0,+,2017-03-07,2017-04-11,2017-04-10
TUESDAY,3,5,0,+,2017-04-11,2017-05-16,2017-05-15
TUESDAY,-3,5,1,+,2016-12-06,2017-01-10,2017-01-09
TUESDAY,-2,5,1,+,2016-12-13,2017-01-17,2017-01-16
TUESDAY,-1,5,1,+,2016-12-20,2017-01-24,2017-01-23
TUESDAY,0,5,1,+,2016-12-27,2017-01-31,2017-01-30
TUESDAY,1,5,1,+,2017-01-03,2017-02-07,2017-02-06
TUESDAY,2,5,1,+,2017-01-10,2017-02-14,2017-02-13
TUESDAY,3,5,1,+,2017-01-17,2017-02-21,2017-02-20
WEDNESDAY,-3,1,0,+,2016-12-07,2016-12-14,2016-12-13
WEDNESDAY,-2,1,0,+,2016-12-14,2016-12-21,2016-12-20
WEDNESDAY,-1,1,0,+,2016-12-21,2016-12-28,2016-12-27
WEDNESDAY,0,1,0,+,2016-12-28,2017-01-04,2017-01-03
WEDNESDAY,1,1,0,+,2017-01-04,2017-01-11,2017-01-10
WEDNESDAY,2,1,0,+,2017-01-11,2017-01-18,2017-01-17
WEDNESDAY,3,1,0,+,2017-01-18,2017-01-25,2017-01-24
WEDNESDAY,-3,5,0,+,2016-09-14,2016-10-19,2016-10-18
WEDNESDAY,-2,5,0,+,2016-10-19,2016-11-23,2016-11-22
WEDNESDAY,-1,5,0,+,2016-11-23,2016-12-28,2016-12-27
WEDNESDAY,0,5,0,+,2016-12-28,2017-02-01,2017-01-31
WEDNESDAY,1,5,0,+,2017-02-01,2017-03-08,2017-03-07
WEDNESDAY,2,5,0,+,2017-03-08,2017-04-12,2017-04-11
WEDNESDAY,3,5,0,+,2017-04-12,2017-05-17,2017-05-16
WEDNESDAY,-3,5,1,+,2016-12-07,2017-01-11,2017-01-10
WEDNESDAY,-2,5,1,+,2016-12-14,2017-01-18,2017-01-17
WEDNESDAY,-1,5,1,+,2016-12-21,2017-01-25,2017-01-24
WEDNESDAY,0,5,1,+,2016-12-28,2017-02-01,2017-01-31
WEDNESDAY,1,5,1,+,2017-01-04,2017-02-08,2017-02-07
WEDNESDAY,2,5,1,+,2017-01-11,2017-02-15,2017-02-14
WEDNESDAY,3,5,1,+,2017-01-18,2017-02-22,2017-02-21
THURSDAY,-3,1,0,+,2016-12-01,2016-12-08,2016-12-07
THURSDAY,-2,1,0,+,2016-12-08,2016-12-15,2016-12-14
THURSDAY,-1,1,0,+,2016-12-15,2016-12-22,2016-12-21
THURSDAY,0,1,0,+,2016-12-22,2016-12-29,2016-12-28
THURSDAY,1,1,0,+,2016-12-29,2017-01-05,2017-01-04
THURSDAY,2,1,0,+,2017-01-05,2017-01-12,2017-01-11
THURSDAY,3,1,0,+,2017-01-12,2017-01-19,2017-01-18
THURSDAY,-3,5,0,+,2016-09-08,2016-10-13,2016-10-12
THURSDAY,-2,5,0,+,2016-10-13,2016-11-17,2016-11-16
THURSDAY,-1,5,0,+,2016-11-17,2016-12-22,2016-12-21
THURSDAY,0,5,0,+,2016-12-22,2017-01-26,2017-01-25
THURSDAY,1,5,0,+,2017-01-26,2017-03-02,2017-03-01
THURSDAY,2,5,0,+,2017-03-02,2017-04-06,2017-04-05
THURSDAY,3,5,0,+,2017-04-06,2017-05-11,2017-05-10
THURSDAY,-3,5,1,+,2016-12-01,2017-01-05,2017-01-04
THURSDAY,-2,5,1,+,2016-12-08,2017-01-12,2017-01-11
THURSDAY,-1,5,1,+,2016-12-15,2017-01-19,2017-01-18
THURSDAY,0,5,1,+,2016-12-22,2017-01-26,2017-01-25
THURSDAY,1,5,1,+,2016-12-29,2017-02-02,2017-02-01
THURSDAY,2,5,1,+,2017-01-05,2017-02-09,2017-02-08
THURSDAY,3,5,1,+,2017-01-12,2017-02-16,2017-02-15
FRIDAY,-3,1,0,+,2016-12-02,2016-12-09,2016-12-08
FRIDAY,-2,1,0,+,2016-12-09,2016-12-16,2016-12-15
FRIDAY,-1,1,0,+,2016-12-16,2016-12-23,2016-12-22
FRIDAY,0,1,0,+,2016-12-23,2016-12-30,2016-12-29
FRIDAY,1,1,0,+,2016-12-30,2017-01-06,2017-01-05
FRIDAY,2,1,0,+,2017-01-06,2017-01-13,2017-01-12
FRIDAY,3,1,0,+,2017-01-13,2017-01-20,2017-01-19
FRIDAY,-3,5,0,+,2016-09-09,2016-10-14,2016-10-13
FRIDAY,-2,5,0,+,2016-10-14,2016-11-18,2016-11-17
FRIDAY,-1,5,0,+,2016-11-18,2016-12-23,2016-12-22
FRIDAY,0,5,0,+,2016-12-23,2017-01-27,2017-01-26
FRIDAY,1,5,0,+,2017-01-27,2017-03-03,2017-03-02
FRIDAY,2,5,0,+,2017-03-03,2017-04-07,2017-04-06
FRIDAY,3,5,0,+,2017-04-07,2017-05-12,2017-05-11
FRIDAY,-3,5,1,+,2016-12-02,2017-01-06,2017-01-05
FRIDAY,-2,5,1,+,2016-12-09,2017-01-13,2017-01-12
FRIDAY,-1,5,1,+,2016-12-16,2017-01-20,2017-01-19
FRIDAY,0,5,1,+,2016-12-23,2017-01-27,2017-01-26
FRIDAY,1,5,1,+,2016-12-30,2017-02-03,2017-02-02
FRIDAY,2,5,1,+,2017-01-06,2017-02-10,2017-02-09
FRIDAY,3,5,1,+,2017-01-13,2017-02-17,2017-02-16
SATURDAY,-3,1,0,+,2016-12-03,2016-12-10,2016-12-09
SATURDAY,-2,1,0,+,2016-12-10,2016-12-17,2016-12-16
SATURDAY,-1,1,0,+,2016-12-17,2016-12-24,2016-12-23
SATURDAY,0,1,0,+,2016-12-24,2016-12-31,2016-12-30
SATURDAY,1,1,0,+,2016-12-31,2017-01-07,2017-01-06
SATURDAY,2,1,0,+,2017-01-07,2017-01-14,2017-01-13
SATURDAY,3,1,0,+,2017-01-14,2017-01-21,2017-01-20
SATURDAY,-3,5,0,+,2016-09-10,2016-10-15,2016-10-14
SATURDAY,-2,5,0,+,2016-10-15,2016-11-19,2016-11-18
SATURDAY,-1,5,0,+,2016-11-19,2016-12-24,2016-12-23
SATURDAY,0,5,0,+,2016-12-24,2017-01-28,2017-01-27
SATURDAY,1,5,0,+,2017-01-28,2017-03-04,2017-03-03
SATURDAY,2,5,0,+,2017-03-04,2017-04-08,2017-04-07
SATURDAY,3,5,0,+,2017-04-08,2017-05-13,2017-05-12
SATURDAY,-3,5,1,+,2016-12-03,2017-01-07,2017-01-06
SATURDAY,-2,5,1,+,2016-12-10,2017-01-14,2017-01-13
SATURDAY,-1,5,1,+,2016-12-17,2017-01-21,2017-01-20
SATURDAY,0,5,1,+,2016-12-24,2017-01-28,2017-01-27
SATURDAY,1,5,1,+,2016-12-31,2017-02-04,2017-02-03
SATURDAY,2,5,1,+,2017-01-07,2017-02-11,2017-02-10
SATURDAY,3,5,1,+,2017-01-14,2017-02-18,2017-02-17
SUNDAY,-3,1,0,+,2016-12-04,2016-12-11,2016-12-10
SUNDAY,-2,1,0,+,2016-12-11,2016-12-18,2016-12-17
SUNDAY,-1,1,0,+,2016-12-18,2016-12-25,2016-12-24
SUNDAY,0,1,0,+,2016-12-25,2017-01-01,2016-12-31
SUNDAY,1,1,0,+,2017-01-01,2017-01-08,2017-01-07
SUNDAY,2,1,0,+,2017-01-08,2017-01-15,2017-01-14
SUNDAY,3,1,0,+,2017-01-15,2017-01-22,2017-01-21
SUNDAY,-3,5,0,+,2016-09-11,2016-10-16,2016-10-15
SUNDAY,-2,5,0,+,2016-10-16,2016-11-20,2016-11-19
SUNDAY,-1,5,0,+,2016-11-20,2016-12-25,2016-12-24
SUNDAY,0,5,0,+,2016-12-25,2017-01-29,2017-01-28
SUNDAY,1,5,0,+,2017-01-29,2017-03-05,2017-03-04
SUNDAY,2,5,0,+,2017-03-05,2017-04-09,2017-04-08
SUNDAY,3,5,0,+,2017-04-09,2017-05-14,2017-05-13
SUNDAY,-3,5,1,+,2016-12-04,2017-01-08,2017-01-07
SUNDAY,-2,5,1,+,2016-12-11,2017-01-15,2017-01-14
SUNDAY,-1,5,1,+,2016-12-18,2017-01-22,2017-01-21
SUNDAY,0,5,1,+,2016-12-25,2017-01-29,2017-01-28
SUNDAY,1,5,1,+,2017-01-01,2017-02-05,2017-02-04
SUNDAY,2,5,1,+,2017-01-08,2017-02-12,2017-02-11
SUNDAY,3,5,1,+,2017-01-15,2017-02-19,2017-02-18
