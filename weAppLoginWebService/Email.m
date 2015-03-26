//
//  Email.m
//  weAppLoginWebService
//
//  Created by Humberto Vieira de Castro on 3/26/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Email.h"

@implementation Email


- (NSString *) enviaEmail:(NSString *)destinatario email:(Email *)email
{
    email.assunto = [email.assunto stringByReplacingOccurrencesOfString:@" " withString:@"%20" ];
    email.texto = [email.texto stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.url.ph/weAppLoginWebservice/retornadados.php?tipo_operacao=4&id_usuario=%d&id_receptor=%d&para=%@&assunto=%@&texto=%@", email.id_usuario, email.id_receptor, destinatario, email.assunto, email.texto];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil ];
    NSLog(@"OOOPA - %@", response);
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    separaAtributos = [separaObjetos objectAtIndex:0];
    
    NSString *strReturn = [separaAtributos objectForKey:@"retorno"];

    
    return strReturn;
    
    
    
    /*
     COMO USAR:
     for(Usuario *pi in [new buscaUsuariosPorNome:@"ble"])
     {
     NSLog(@"%@", pi.user);
     }
     
     
     */
}



@end
