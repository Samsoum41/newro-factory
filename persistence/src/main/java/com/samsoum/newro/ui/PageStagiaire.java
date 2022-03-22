package com.samsoum.newro.ui;

import java.util.ArrayList;
import java.util.Objects;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.samsoum.newro.model.Stagiaire;


@Component
@Scope("prototype")
public class PageStagiaire {
	public static final int NOMBRES_DE_LIGNES_PAR_DEFAUT = 10;
	public static final int STARTING_PAGE = 1;
	private int numero;
	private int nbLignes = NOMBRES_DE_LIGNES_PAR_DEFAUT;
	private ArrayList<Stagiaire> contenu;
	private int nbStagiaires;
	
	public PageStagiaire(int numero, int nbLignes, ArrayList<Stagiaire> contenu, int nbStagiaires) {
		super();
		this.numero = numero;
		this.setNbLignes(nbLignes);
		this.contenu = contenu; 
		this.nbStagiaires = nbStagiaires;
	}

	public int getNumberOfPages() throws PaginationException {
			return (nbStagiaires / nbLignes) + 1;
	}

	private static boolean hasNext(PageStagiaire page) throws PaginationException {
		int nbPages = page.getNumberOfPages();
		return nbPages > page.getNumero();
	}

	private static boolean hasPrevious(PageStagiaire page) {
		return page.getNumero() > 1;
	}

	public static int next(PageStagiaire page) throws PaginationException {
		// TODO : gérer les fuckings exceptions
		if (PageStagiaire.hasNext(page)) {
			return page.getNumero() + 1;
		} else {
			return page.getNumero();
		}
	}

	public static int previous(PageStagiaire page) {
		if (PageStagiaire.hasPrevious(page)) {
			return page.getNumero() - 1;
		} else {
			return page.getNumero();
		}
	}
	
	public ArrayList<Integer> getNavigationPages() throws PaginationException {
		ArrayList<Integer> result = new ArrayList<Integer>();
		int nbOfPages = getNumberOfPages();
		if (numero == nbOfPages) {
			result.add(numero - 2);
			result.add(numero - 1);
			result.add(numero);
		} else if (numero == nbOfPages - 1) {
			result.add(numero - 1);
			result.add(numero);
			result.add(numero + 1);
		} else {
			result.add(numero);
			result.add(numero + 1);
			result.add(numero + 2);
		}
		return result;
	}

	public int getNumero() {
		return numero;
	}

	public ArrayList<Stagiaire> getContenu() {
		return contenu;
	}

	public int getNbLignes() {
		return nbLignes;
	}

	public void setNbLignes(int nbLignes) {
		this.nbLignes = nbLignes;
	}

	@Override
	public int hashCode() {
		return Objects.hash(contenu, nbLignes, numero);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}	
		if (getClass() != obj.getClass()) {
			return false;
		}
		PageStagiaire other = (PageStagiaire) obj;
		return Objects.equals(contenu, other.contenu) && nbLignes == other.nbLignes && numero == other.numero;
	}

	@Override
	public String toString() {
		return "Page numéro : " + numero + " contenant : " + contenu;
	}

}
