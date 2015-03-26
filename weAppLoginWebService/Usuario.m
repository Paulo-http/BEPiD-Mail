//
//  Usuario.m
//  weAppLoginWebService
//
//  Created by Humberto Vieira de Castro on 3/20/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

- (NSMutableArray *) retornaUsuarios
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://betovieira.url.ph/weAppLoginWebservice/retornadados.php?tipo_operacao=2"]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil ];
    
    //NSError** jsonParsingError = nil;
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSMutableArray *listUser = [[NSMutableArray alloc] init];
    NSDictionary *separaAtributos;
    
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Usuario *u = [[Usuario alloc] init];
        u.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
        u.user = [separaAtributos objectForKey:@"user"];
        u.senha = [separaAtributos objectForKey:@"senha"];
        u.apelido = [separaAtributos objectForKey:@"apelido"];
        u.email = [separaAtributos objectForKey:@"email"];
        
        [listUser addObject:u];
    }
    
    return listUser;
}


- (NSString *) insereUsuario:(Usuario*)u
{
    NSString *string = [NSString stringWithFormat:@"http://betovieira.url.ph/weAppLoginWebservice/retornadados.php?tipo_operacao=1&user=%@&senha=%@&apelido=%@&email=%@", u.user, u.senha, u.apelido, u.email];
    
    NSLog(@"%@", string);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    separaAtributos = [separaObjetos objectAtIndex:0];
    
    NSString *strReturn = [separaAtributos objectForKey:@"retorno"];
    
    return strReturn;
}

- (NSMutableArray *) buscaUsuariosPorNome:(NSString *) palavra
{
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.url.ph/weAppLoginWebservice/retornadados.php?tipo_operacao=3&user=%@", palavra];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSMutableArray *listUser = [[NSMutableArray alloc] init];
    NSDictionary *separaAtributos;
    
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Usuario *u = [[Usuario alloc] init];
        u.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
        u.user = [separaAtributos objectForKey:@"user"];
        u.senha = [separaAtributos objectForKey:@"senha"];
        u.apelido = [separaAtributos objectForKey:@"apelido"];
        u.email = [separaAtributos objectForKey:@"email"];
        
        [listUser addObject:u];
    }
    
    return listUser;
    
}


@end
