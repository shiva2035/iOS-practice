//
//  WeatherDetailViewController.m
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/25/16.
//  Copyright © 2016 Accolite. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "XMLReader.h"

@interface WeatherDetailViewController ()

@property (nonatomic) NSURLSession *session;
@property NSString *soapMessage;
@property NSString *currentElement;
@property NSMutableData *webResponseData;

@end

@implementation WeatherDetailViewController

@synthesize soapMessage, webResponseData, currentElement;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityTextField.text = self.city;
    NSLog(@"In VDL: %@", self.cityTextField.text);
}
- (void) viewWillAppear:(BOOL)animated
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    _session = [NSURLSession sessionWithConfiguration:config
                                             delegate:nil
                                        delegateQueue:nil];
    NSLog(@"vWA: %@", self.cityTextField.text);
    [self fetchFeed];
    
}

-(void)fetchFeed
{
    
    //NSString *citySelected = [city stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString * citySelected = self.cityTextField.text;
    NSLog(@"fetchFeed :: Selected City : %@",citySelected);
    
    soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                  "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                  "<soap:Body>"
                  "<GetWeather xmlns=\"http://www.webserviceX.NET\">"
                  "<CityName>%@</CityName>"
                  "<CountryName>%@</CountryName>"
                  "</GetWeather>"
                  "</soap:Body>"
                 "</soap:Envelope>", citySelected, @"India"];//self.cityTextField.text];
    
    NSURL *url = [NSURL URLWithString:@"http://www.webservicex.net/globalweather.asmx"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", (unsigned int)[soapMessage length]];
    
    [request addValue:@"www.webservicex.net" forHTTPHeaderField:@"Host"];
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue: @"http://www.webserviceX.NET/GetWeather" forHTTPHeaderField:@"SOAPAction"];
    [request addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request
                                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSString *responseXml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
    NSLog(@"ResponseXML: %@",responseXml);
        
    NSData *xmlAsData = [responseXml dataUsingEncoding:NSUTF8StringEncoding];
        
    NSError *parseError = nil;
    
                                                         
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLData:xmlAsData error:&parseError];
    NSString *resultAsString = xmlDictionary[@"soap:Envelope"][@"soap:Body"][@"GetWeatherResponse"][@"GetWeatherResult"][@"text"];
    if([responseXml rangeOfString:@"Data Not Found"].location == NSNotFound){
        NSLog(@"DATA NOT FOUND***********");
    }else{
        NSLog(@"DATA FOUND");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Data Received"
                                                        message:@"Unable to fetch the Weather Details"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
                                                         
    NSData *resultSetAsData = [resultAsString dataUsingEncoding:NSUTF16StringEncoding];
    NSDictionary *weatherResult = [XMLReader dictionaryForXMLData:resultSetAsData error:&error];
    NSLog(@"Weather :\n %@",weatherResult);
    //_weatherInfo = [weatherResult valueForKeyPath:@"CurrentWeather"];
        //[self showWeatherInfo];
        
    }];
    
    
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
