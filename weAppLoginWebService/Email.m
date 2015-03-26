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


- (NSMutableArray *) ultimosEmails:(NSString*) id_usuario
{
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.url.ph/weAppLoginWebservice/retornadados.php?tipo_operacao=5&id_usuario=%@", id_usuario];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSMutableArray *listUser = [[NSMutableArray alloc] init];
    NSDictionary *separaAtributos;
    
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Email *e = [[Email alloc] init];
        e.id_email = [[separaAtributos objectForKey:@"id_email"] intValue];
        e.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
        e.id_receptor = [[separaAtributos objectForKey:@"id_receptor"] intValue];
        e.assunto = [separaAtributos objectForKey:@"assunto"];
        e.texto = [separaAtributos objectForKey:@"texto"];
        
        [listUser addObject:e];
    }
    
    return listUser;
    /*
     como usar
     
     NSMutableArray *ai = [e ultimosEmails:@"1"];
     
     Email *x = [ai objectAtIndex:0];
     
     */
}


@end
