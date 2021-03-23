/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstsort.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 00:28:05 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/24 00:38:07 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static t_list	*merge(t_list *a, t_list *b, int (*f)(void*, void*))
{
	t_list	result;
	t_list	*x;

	x = &result;
	while (a != NULL && b != NULL)
	{
		if (f(a->content, b->content) > 0)
		{
			x->next = b;
			x = x->next;
			b = b->next;
		}
		else
		{
			x->next = a;
			x = x->next;
			a = a->next;
		}
	}
	if (a == NULL)
		x->next = b;
	else
		x->next = a;
	return (result.next);
}

static t_list	*merge_sort(t_list *lst, int (*f)(void*, void*))
{
	t_list	*a;
	t_list	*b;
	t_list	*x;

	if (!lst || !lst->next)
		return (lst);
	a = lst;
	b = lst->next;
	if (b != NULL)
		b = b->next;
	while (b != NULL)
	{
		a = a->next;
		b = b->next;
		if (b != NULL)
			b = b->next;
	}
	x = a->next;
	a->next = NULL;
	return (merge(merge_sort(lst, f), merge_sort(x, f), f));
}

void			ft_lstsort(t_list **begin_list, int (*cmp)())
{
	if (!begin_list || !*begin_list)
		return ;
	*begin_list = merge_sort(*begin_list, cmp);
}
