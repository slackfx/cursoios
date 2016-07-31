//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController

-(id) init {
    self = [super init];
    
    UIBarButtonItem * botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.contatoDAO = [ContatoDAO contatoDAOInstance];
    self.linhaSelecionada = -1;
    
    return self;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contato *contato = [self.contatoDAO contatoDoIndice:indexPath.row];
        [self.contatoDAO removeContato: contato];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.contatoDAO contatoDoIndice:indexPath.row];
    [self exibeFormulario];
}

-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.delegate = self;
    if (self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    
    [self.navigationController pushViewController:form animated:YES];
}

-(NSInteger) tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contatoDAO total];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }

    Contato *contato = [self.contatoDAO contatoDoIndice: indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void) contatoAdicionado: (Contato *) contato {
    self.linhaSelecionada = [self.contatoDAO indiceDoContato:contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso!", contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato Adicionado" message:mensagem preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
    
    NSLog(@"Adicionado %@", contato);
}

-(void) contatoAtualizado: (Contato *) contato {
    self.linhaSelecionada = [self.contatoDAO indiceDoContato:contato];
    NSLog(@"Atualizado %@", contato);
}

-(void) viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}

@end
