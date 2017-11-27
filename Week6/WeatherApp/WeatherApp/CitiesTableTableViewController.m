//
//  CitiesTableTableViewController.m
//  WeatherApp
//
//  Created by Shiva Kumar K on 8/15/16.
//  Copyright © 2016 Accolite. All rights reserved.
//


#import "CitiesTableTableViewController.h"
#import "XMLReader.h"
#import "WeatherDetailViewController.h"
#import "SharedResourceHolder.h"
#import <Foundation/Foundation.h>

@interface CitiesTableTableViewController ()

@property (nonatomic) NSURLSession *session;
@property (nonatomic, copy) NSMutableArray *cities;
@property NSString *soapMessage;
@property NSString *currentElement;
@property NSMutableData *webResponseData;
@property NSDictionary *xmlDictionary;

@property (nonatomic) NSString *searchKey;
- (void) setSearchKey:(NSString *)searchKey;


@end

@implementation CitiesTableTableViewController

@synthesize soapMessage, webResponseData, currentElement;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"In CTTVC: %@", self.country);
    self.country = self.country;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

+ (void) setSearchKey:(NSString *)searchKey
{
    self.searchKey = searchKey;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
 
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"Country Search Results";
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        NSLog(@"IN Cities Table VC");
        NSLog(@"%@", self.country);
        [self fetchFeed];
    }
    return self;
}


- (void)fetchFeed
{
    
    NSLog(@"Country: %@", self.country);
    //first create the soap envelope
    soapMessage=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                 "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                 "<soap:Body>"
                 "<GetCitiesByCountry xmlns=\"http://www.webserviceX.NET\">"
                 "<CountryName>%@</CountryName>"
                 "</GetCitiesByCountry>"
                 "</soap:Body>"
                 "</soap:Envelope>", @"india"];

    
    
    //CREATE REQUEST URL
    NSURL *url = [NSURL URLWithString:@"http://www.webservicex.net/globalweather.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //REQUEST HEADERS
    [theRequest addValue:@"www.webservicex.net" forHTTPHeaderField:@"Host"];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://www.webserviceX.NET/GetCitiesByCountry" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //INITIATE THE CONNECTION
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if(connection)
    {
        webResponseData = [NSMutableData data] ;
    }
    else
    {
        NSLog(@"Connection is NULL");
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.cities count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    
    NSString *city;
    city = self.cities[indexPath.row];
    cell.textLabel.text=[city stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return cell;
}


//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    WeatherDetailViewController *detailViewController = [[WeatherDetailViewController alloc] initWithNibName:@"WeatherDetailViewController" bundle:nil];
    // Pass the selected object to the new view controller.
    NSString *city = self.cities[indexPath.row];
    detailViewController.city = city;
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//Implement the connection delegate methods.
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseData  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseData  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again.");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    NSLog(@"Received %lu Bytes", (unsigned long)[webResponseData length]);
    
    NSString *responseXML = [[NSString alloc] initWithBytes:[webResponseData mutableBytes]
                                                length:[webResponseData length]
                                              encoding:NSUTF8StringEncoding];
    
    responseXML = [responseXML stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    responseXML = [responseXML stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    responseXML = [responseXML stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    //NSLog(@"%@", responseXML);
    
    NSError *parseError = nil;
    
    NSData *myData = [responseXML dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLData:myData error:&parseError];
    
    NSDictionary *xmldict2 = [XMLReader dictionaryForXMLString:xmlDictionary[@"soap:Envelope"][@"soap:Body"][@"GetCitiesByCountryResponse"][@"GetCitiesByCountryResult"][@"text"] error:&parseError];
    
    NSDictionary *dict = [xmldict2 valueForKeyPath:@"NewDataSet.Table.City.text"];
    self.cities = [NSMutableArray arrayWithObjects:dict, nil];
    NSLog(@"Cities:: %@", self.cities);
    if([self.cities count] >0){
        self.cities = self.cities[0];
        //NSLog(@"Cities %@",self.cities);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Data Received"
                                                        message:@"Unable to fetch the countries"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    }


}




@end
